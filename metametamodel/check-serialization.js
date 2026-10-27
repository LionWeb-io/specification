#!/usr/bin/env node --no-warnings

/*
 * Run this script as follows from the `metametamodel/` directory:
 *
 *  $ ./check-serialization.js <path to {lioncore|builtins}.json> <version, e.g. 2026.1>
 *
 */

import { readFileSync } from "node:fs"
import { argv, exit } from "node:process"


const path = argv[2]
const version = argv[3]


const chunk = JSON.parse(readFileSync(path))

const isBuiltins = path.endsWith("builtins.json")


const infoPerId = {}
for (const node of chunk.nodes) {
    const propertySettingFor = (language, featureKey) =>
        node.properties.find(({ property }) => property.language === language && property.version === version && property.key === featureKey)
    infoPerId[node.id] = {
        key: propertySettingFor("LionCore-M3", "IKeyed-key")?.value,
        name: propertySettingFor("LionCore-builtins", "LionCore-builtins-INamed-name")?.value,
        node
    }
}

const nameFragmentsFor = (node) =>
    node.parent === null
        ? [ infoPerId[node.id].key ] // <== node is a Language
        : [ ...nameFragmentsFor(infoPerId[node.parent].node), infoPerId[node.id].name ]
const localQualifiedName = (node) => {
    const nameFragments = nameFragmentsFor(node)
    return nameFragments.length > 1
        ? nameFragments.slice(1).join("-")
        : nameFragments[0]
}


let foundProblems = false
const error = (message) => {
    console.error(message)
    foundProblems = true
}

for (const node of chunk.nodes) {
    const { key, name } = infoPerId[node.id]
    ;key || error(`didn’t find a key setting on the node with ID "${node.id}"`)
    ;name || error(`didn’t find a name setting on the node with ID "${node.id}"`)
    const localQualifiedName_ = localQualifiedName(node)
    const keyPostfix = `${key}-${version.replaceAll(".", "-")}`
    if (isBuiltins) {
        const expectedKey = `LionCore-builtins-${localQualifiedName_}`
        ;(key === expectedKey || key === "LionCore-builtins") || error(`node with ID "${node.id}" has key "${key}" but this was expected to be "${expectedKey}"`)
        const expectedId = keyPostfix
        ;(node.id === expectedId) || error(`node with ID "${node.id}" was expected to have ID "${expectedId}"`)
    } else {
        ;(localQualifiedName_ === key) || error(`node with ID "${node.id}" has key "${key}" but this was expected to be "${localQualifiedName_}"`)
        const expectedId = `-id-${keyPostfix}`
        ;(node.id === expectedId) || error(`node with ID "${node.id}" was expected to have ID "${expectedId}"`)
    }
}

if (foundProblems) {
    exit(1)
} else {
    console.info(`(no problems found in ${path})`)
}

