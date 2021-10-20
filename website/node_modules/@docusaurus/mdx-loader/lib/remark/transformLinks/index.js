"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const utils_1 = require("@docusaurus/utils");
const unist_util_visit_1 = tslib_1.__importDefault(require("unist-util-visit"));
const path_1 = tslib_1.__importDefault(require("path"));
const url_1 = tslib_1.__importDefault(require("url"));
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const escape_html_1 = tslib_1.__importDefault(require("escape-html"));
const utils_2 = require("../utils");
const utils_3 = require("@docusaurus/core/lib/webpack/utils");
const { loaders: { inlineMarkdownLinkFileLoader }, } = utils_3.getFileLoaderUtils();
async function ensureAssetFileExist(fileSystemAssetPath, sourceFilePath) {
    const assetExists = await fs_extra_1.default.pathExists(fileSystemAssetPath);
    if (!assetExists) {
        throw new Error(`Asset ${utils_1.toMessageRelativeFilePath(fileSystemAssetPath)} used in ${utils_1.toMessageRelativeFilePath(sourceFilePath)} not found.`);
    }
}
// transform the link node to a jsx link with a require() call
function toAssetRequireNode({ node, filePath, requireAssetPath, }) {
    /* eslint-disable no-param-reassign */
    let relativeRequireAssetPath = utils_1.posixPath(path_1.default.relative(path_1.default.dirname(filePath), requireAssetPath));
    // nodejs does not like require("assets/file.pdf")
    relativeRequireAssetPath = relativeRequireAssetPath.startsWith('.')
        ? relativeRequireAssetPath
        : `./${relativeRequireAssetPath}`;
    const href = `require('${inlineMarkdownLinkFileLoader}${utils_1.escapePath(relativeRequireAssetPath)}').default`;
    const children = utils_2.stringifyContent(node);
    const title = node.title ? `title="${escape_html_1.default(node.title)}"` : '';
    node.type = 'jsx';
    node.value = `<a target="_blank" href={${href}}${title}>${children}</a>`;
}
// If the link looks like an asset link, we'll link to the asset,
// and use a require("assetUrl") (using webpack url-loader/file-loader)
// instead of navigating to such link
async function convertToAssetLinkIfNeeded({ node, staticDir, filePath, }) {
    const assetPath = node.url;
    const hasSiteAlias = assetPath.startsWith('@site/');
    const hasAssetLikeExtension = path_1.default.extname(assetPath) && !assetPath.match(/#|.md|.mdx|.html/);
    const looksLikeAssetLink = hasSiteAlias || hasAssetLikeExtension;
    if (!looksLikeAssetLink) {
        return;
    }
    function toAssetLinkNode(requireAssetPath) {
        toAssetRequireNode({
            node,
            filePath,
            requireAssetPath,
        });
    }
    if (assetPath.startsWith('@site/')) {
        const siteDir = path_1.default.join(staticDir, '..');
        const fileSystemAssetPath = path_1.default.join(siteDir, assetPath.replace('@site/', ''));
        await ensureAssetFileExist(fileSystemAssetPath, filePath);
        toAssetLinkNode(fileSystemAssetPath);
    }
    else if (path_1.default.isAbsolute(assetPath)) {
        const fileSystemAssetPath = path_1.default.join(staticDir, assetPath);
        if (await fs_extra_1.default.pathExists(fileSystemAssetPath)) {
            toAssetLinkNode(fileSystemAssetPath);
        }
    }
    else {
        const fileSystemAssetPath = path_1.default.join(path_1.default.dirname(filePath), assetPath);
        if (await fs_extra_1.default.pathExists(fileSystemAssetPath)) {
            toAssetLinkNode(fileSystemAssetPath);
        }
    }
}
async function processLinkNode({ node, filePath, staticDir, }) {
    var _a, _b, _c;
    if (!node.url) {
        // try to improve error feedback
        // see https://github.com/facebook/docusaurus/issues/3309#issuecomment-690371675
        const title = node.title || ((_a = node.children[0]) === null || _a === void 0 ? void 0 : _a.value) || '?';
        const line = ((_c = (_b = node === null || node === void 0 ? void 0 : node.position) === null || _b === void 0 ? void 0 : _b.start) === null || _c === void 0 ? void 0 : _c.line) || '?';
        throw new Error(`Markdown link URL is mandatory in "${utils_1.toMessageRelativeFilePath(filePath)}" file (title: ${title}, line: ${line}).`);
    }
    const parsedUrl = url_1.default.parse(node.url);
    if (parsedUrl.protocol) {
        return;
    }
    await convertToAssetLinkIfNeeded({ node, staticDir, filePath });
}
const plugin = (options) => {
    const transformer = async (root) => {
        const promises = [];
        unist_util_visit_1.default(root, 'link', (node) => {
            promises.push(processLinkNode({ node, ...options }));
        });
        await Promise.all(promises);
    };
    return transformer;
};
exports.default = plugin;
