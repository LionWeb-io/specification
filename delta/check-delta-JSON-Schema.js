#!/usr/bin/env -S node --no-warnings

/*
 * Run this script as follows from the `delta/` directory:
 *
 *  $ ./check-delta-JSON-Schema.js
 *
 */

import { readFileSync, writeFileSync } from "node:fs"
import { EOL } from "node:os"

const deltaSchema = JSON.parse(readFileSync("delta.schema.json"))

const defs = deltaSchema.$defs

const logger = (level) => (message) => { console[level](`[${level.toUpperCase()}] ${message}`) }
const info = logger("info")
const warn = logger("warn")
const error = logger("error")

let changed = false

for (const [name, def] of Object.entries(defs)) {
    if ("properties" in def) {
        if (!("type" in def && def.type === "object")) {
            warn(`${name}: no type: "object" entry`)
            defs[name] = { type: "object", ...def }
            changed = true
        }
        const nTotal = Object.values(def.properties).length
        let nRequired = def.required.length
        // info(`${name} has ${def.minProperties}-${def.maxProperties} properties with ${nRequired} required and ${nTotal} total`)
        if ("minProperties" in def) {
            if (def.minProperties !== nRequired) {
                error(`${name}: mismatch minProperties — should be ${nRequired}`)
            }
        } else {
            info(`${name}: (no minProperties)`)
        }
        if ("maxProperties" in def) {
            if (def.maxProperties !== nTotal) {
                error(`${name}: mismatch maxProperties — should be ${nTotal}`)
            }
        } else {
            info(`${name}: (no maxProperties)`)
        }
    }
}

if (changed) {
    writeFileSync("changed-delta.schema.json", JSON.stringify(deltaSchema, null, 2) + EOL)
}

