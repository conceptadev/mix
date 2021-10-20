"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.transformMarkdownContent = exports.transformMarkdownLine = exports.transformMarkdownHeadingLine = exports.unwrapMarkdownLinks = void 0;
const tslib_1 = require("tslib");
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const github_slugger_1 = tslib_1.__importDefault(require("github-slugger"));
const chalk_1 = tslib_1.__importDefault(require("chalk"));
const server_1 = require("../server");
const init_1 = tslib_1.__importDefault(require("../server/plugins/init"));
const lodash_1 = require("lodash");
const utils_1 = require("@docusaurus/utils");
const utils_2 = require("../server/utils");
function unwrapMarkdownLinks(line) {
    return line.replace(/\[([^\]]+)\]\([^)]+\)/g, (match, p1) => p1);
}
exports.unwrapMarkdownLinks = unwrapMarkdownLinks;
function addHeadingId(line, slugger) {
    let headingLevel = 0;
    while (line.charAt(headingLevel) === '#') {
        headingLevel += 1;
    }
    const headingText = line.slice(headingLevel).trimEnd();
    const headingHashes = line.slice(0, headingLevel);
    const slug = slugger.slug(unwrapMarkdownLinks(headingText));
    return `${headingHashes}${headingText} {#${slug}}`;
}
function transformMarkdownHeadingLine(line, slugger) {
    if (!line.startsWith('#')) {
        throw new Error(`Line is not a Markdown heading: ${line}.`);
    }
    const parsedHeading = utils_1.parseMarkdownHeadingId(line);
    // Do not process if id is already therer
    if (parsedHeading.id) {
        return line;
    }
    return addHeadingId(line, slugger);
}
exports.transformMarkdownHeadingLine = transformMarkdownHeadingLine;
function transformMarkdownLine(line, slugger) {
    // Ignore h1 headings on purpose, as we don't create anchor links for those
    if (line.startsWith('##')) {
        return transformMarkdownHeadingLine(line, slugger);
    }
    else {
        return line;
    }
}
exports.transformMarkdownLine = transformMarkdownLine;
function transformMarkdownLines(lines) {
    let inCode = false;
    const slugger = new github_slugger_1.default();
    return lines.map((line) => {
        if (line.startsWith('```')) {
            inCode = !inCode;
            return line;
        }
        else {
            if (inCode) {
                return line;
            }
            return transformMarkdownLine(line, slugger);
        }
    });
}
function transformMarkdownContent(content) {
    return transformMarkdownLines(content.split('\n')).join('\n');
}
exports.transformMarkdownContent = transformMarkdownContent;
async function transformMarkdownFile(filepath) {
    const content = await fs_extra_1.default.readFile(filepath, 'utf8');
    const updatedContent = transformMarkdownLines(content.split('\n')).join('\n');
    if (content !== updatedContent) {
        await fs_extra_1.default.writeFile(filepath, updatedContent);
        return filepath;
    }
    return undefined;
}
// We only handle the "paths to watch" because these are the paths where the markdown files are
// Also we don't want to transform the site md docs that do not belong to a content plugin
// For example ./README.md should not be transformed
async function getPathsToWatch(siteDir) {
    const context = await server_1.loadContext(siteDir);
    const pluginConfigs = server_1.loadPluginConfigs(context);
    const plugins = await init_1.default({
        pluginConfigs,
        context,
    });
    return lodash_1.flatten(plugins.map((plugin) => { var _a, _b; return (_b = (_a = plugin === null || plugin === void 0 ? void 0 : plugin.getPathsToWatch) === null || _a === void 0 ? void 0 : _a.call(plugin)) !== null && _b !== void 0 ? _b : []; }));
}
async function writeHeadingIds(siteDir) {
    const markdownFiles = await utils_2.safeGlobby(await getPathsToWatch(siteDir), {
        expandDirectories: ['**/*.{md,mdx}'],
    });
    const result = await Promise.all(markdownFiles.map(transformMarkdownFile));
    const pathsModified = result.filter(Boolean);
    if (pathsModified.length) {
        console.log(chalk_1.default.green(`Heading ids added to Markdown files (${pathsModified.length}/${markdownFiles.length} files):
- ${pathsModified.join('\n- ')}`));
    }
    else {
        console.log(chalk_1.default.yellow(`${markdownFiles.length} Markdown files already have explicit heading ids.`));
    }
}
exports.default = writeHeadingIds;
