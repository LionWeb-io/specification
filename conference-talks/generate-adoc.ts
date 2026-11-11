#!/usr/bin/env node --no-warnings

import { readFileSync, writeFileSync } from "node:fs"    // (ignore the warning — it’s fine ;))

type Presenter = {
    name: string
}

type Talk = Partial<{
    title: string,
    presenters: string  // --> ref. $.presenters[<lookup>]
    pdf: string
    pptx: string
    poster: string
    video: string
    conference: {
        site: string
        designation?: string
    }
}> & (
    | {
        series: string, // --> ref. $.series[<lookup>]
        year: number
    }
    | {
        other: string,
    }
)

type PresentersByHandle = Record<string, Presenter>

type ConferenceTalks = {
    presenters: PresentersByHandle,
    talks: Talk[]
}


const conferenceTalks: ConferenceTalks = JSON.parse(readFileSync("conference-talks.json", "utf8"))

let adoc = `= Conference talks

This folder holds references to talks we, or other people, have given at various conferences.
References can consist of: slide deck (in both PDF and PowerPoint format), a video recording of the talk (when and where available), conference website.

`


const rendered = (talk: Talk, presentersByHandle: PresentersByHandle) => {
    const { title, presenters: presentersRefs, conference, pdf, pptx, poster, video } = talk
    const fragments: string[] = []

    if (title) {
        fragments.push(`__${title}__`)
    }

    if (presentersRefs) {
        for (const presenterRef of presentersRefs) {
            const presenter = presentersByHandle[presenterRef]
            if (presenter) {
                fragments.push(presenter.name)
            } else {
                console.error(`unresolvable reference (unknown handle) to presenter: ${presenterRef}`)
            }
        }
    }

    if (conference) {
        fragments.push(`${conference.site}[${conference.designation ?? "conference site"}]`)
    }

    if (pdf) {
        fragments.push(`xref:${pdf}[slides (PDF)]`)
    }
    if (pptx) {
        fragments.push(`xref:${pptx}[slides (PowerPoint)]`)
    }
    if (poster) {
        fragments.push(`xref:${poster}[poster (PDF)]`)
    }
    if (video) {
        const isYouTube = video.startsWith("https://www.youtube.com/")
        fragments.push(`${video}${isYouTube && "&t=0s"}[video${isYouTube ? " (YouTube)" : ""}]`)
    }
    return fragments.join(", ")
}



const series2year2talks: Record<string, Record<number, Talk[]>> = {}
const otherTalks: Talk[] = []
for (const talk of conferenceTalks.talks) {
    const { series, year, other } = talk    // (ignore the type warnings — it’s fine ;))
    if (series && year) {
        if (!(series in series2year2talks)) {
            series2year2talks[series] = []
        }
        if (!(year in series2year2talks[series])) {
            series2year2talks[series][year] = []
        }
        series2year2talks[series][year].push(talk)
    } else if (other) {
        otherTalks.push(talk)
    }
}

Object.entries(series2year2talks).forEach(([ series, year2talks ]) => {
    adoc += `
== ${series}\n`
    Object.entries(year2talks).forEach(([ year, talks ]) => {
        adoc += `\n${year}::\n`
        for (const talk of talks) {
            adoc += "    * " + rendered(talk, conferenceTalks.presenters) + "\n"
        }
    })
    adoc += "\n"
})

adoc += `
== Other

`
for (const talk of otherTalks) {    // (ignore the type warnings below — it’s fine ;))
    adoc += `${talk.other}::
    ${rendered(talk, conferenceTalks.presenters)}

`
}

writeFileSync("conference-talks.adoc", adoc)

