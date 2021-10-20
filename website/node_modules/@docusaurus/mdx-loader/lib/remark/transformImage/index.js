"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const unist_util_visit_1 = tslib_1.__importDefault(require("unist-util-visit"));
const path_1 = tslib_1.__importDefault(require("path"));
const url_1 = tslib_1.__importDefault(require("url"));
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const escape_html_1 = tslib_1.__importDefault(require("escape-html"));
const utils_1 = require("@docusaurus/core/lib/webpack/utils");
const utils_2 = require("@docusaurus/utils");
const { loaders: { inlineMarkdownImageFileLoader }, } = utils_1.getFileLoaderUtils();
const createJSX = (node, pathUrl) => {
    const jsxNode = node;
    jsxNode.type = 'jsx';
    jsxNode.value = `<img ${node.alt ? `alt={"${escape_html_1.default(node.alt)}"} ` : ''}${node.url
        ? `src={require("${inlineMarkdownImageFileLoader}${utils_2.escapePath(pathUrl)}").default}`
        : ''}${node.title ? ` title="${escape_html_1.default(node.title)}"` : ''} />`;
    if (jsxNode.url) {
        delete jsxNode.url;
    }
    if (jsxNode.alt) {
        delete jsxNode.alt;
    }
    if (jsxNode.title) {
        delete jsxNode.title;
    }
};
async function ensureImageFileExist(imagePath, sourceFilePath) {
    const imageExists = await fs_extra_1.default.pathExists(imagePath);
    if (!imageExists) {
        throw new Error(`Image ${utils_2.toMessageRelativeFilePath(imagePath)} used in ${utils_2.toMessageRelativeFilePath(sourceFilePath)} not found.`);
    }
}
async function processImageNode(node, { filePath, staticDir }) {
    if (!node.url) {
        throw new Error(`Markdown image URL is mandatory in "${utils_2.toMessageRelativeFilePath(filePath)}" file`);
    }
    const parsedUrl = url_1.default.parse(node.url);
    if (parsedUrl.protocol) {
        // pathname:// is an escape hatch,
        // in case user does not want his images to be converted to require calls going through webpack loader
        // we don't have to document this for now,
        // it's mostly to make next release less risky (2.0.0-alpha.59)
        if (parsedUrl.protocol === 'pathname:') {
            node.url = node.url.replace('pathname://', '');
        }
    }
    // images without protocol
    else if (path_1.default.isAbsolute(node.url)) {
        // absolute paths are expected to exist in the static folder
        const expectedImagePath = path_1.default.join(staticDir, node.url);
        await ensureImageFileExist(expectedImagePath, filePath);
        createJSX(node, utils_2.posixPath(expectedImagePath));
    }
    // We try to convert image urls without protocol to images with require calls
    // going through webpack ensures that image assets exist at build time
    else {
        // relative paths are resolved against the source file's folder
        const expectedImagePath = path_1.default.join(path_1.default.dirname(filePath), node.url);
        await ensureImageFileExist(expectedImagePath, filePath);
        createJSX(node, node.url.startsWith('./') ? node.url : `./${node.url}`);
    }
}
const plugin = (options) => {
    const transformer = async (root) => {
        const promises = [];
        unist_util_visit_1.default(root, 'image', (node) => {
            promises.push(processImageNode(node, options));
        });
        await Promise.all(promises);
    };
    return transformer;
};
exports.default = plugin;
