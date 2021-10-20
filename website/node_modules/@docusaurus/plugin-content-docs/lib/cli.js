"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.cliDocsVersionCommand = void 0;
const tslib_1 = require("tslib");
const versions_1 = require("./versions");
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const path_1 = tslib_1.__importDefault(require("path"));
const sidebars_1 = require("./sidebars");
const constants_1 = require("@docusaurus/core/lib/constants");
function createVersionedSidebarFile({ siteDir, pluginId, sidebarPath, version, options, }) {
    // Load current sidebar and create a new versioned sidebars file (if needed).
    const loadedSidebars = sidebars_1.loadSidebars(sidebarPath, options);
    // Do not create a useless versioned sidebars file if sidebars file is empty or sidebars are disabled/false)
    const shouldCreateVersionedSidebarFile = Object.keys(loadedSidebars).length > 0;
    if (shouldCreateVersionedSidebarFile) {
        // TODO @slorber: this "version prefix" in versioned sidebars looks like a bad idea to me
        // TODO try to get rid of it
        // Transform id in original sidebar to versioned id.
        const normalizeItem = (item) => {
            switch (item.type) {
                case 'category':
                    return { ...item, items: item.items.map(normalizeItem) };
                case 'ref':
                case 'doc':
                    return {
                        type: item.type,
                        id: `version-${version}/${item.id}`,
                    };
                default:
                    return item;
            }
        };
        const versionedSidebar = Object.entries(loadedSidebars).reduce((acc, [sidebarId, sidebarItems]) => {
            const newVersionedSidebarId = `version-${version}/${sidebarId}`;
            acc[newVersionedSidebarId] = sidebarItems.map(normalizeItem);
            return acc;
        }, {});
        const versionedSidebarsDir = versions_1.getVersionedSidebarsDirPath(siteDir, pluginId);
        const newSidebarFile = path_1.default.join(versionedSidebarsDir, `version-${version}-sidebars.json`);
        fs_extra_1.default.ensureDirSync(path_1.default.dirname(newSidebarFile));
        fs_extra_1.default.writeFileSync(newSidebarFile, `${JSON.stringify(versionedSidebar, null, 2)}\n`, 'utf8');
    }
}
// Tests depend on non-default export for mocking.
function cliDocsVersionCommand(version, siteDir, pluginId, options) {
    // It wouldn't be very user-friendly to show a [default] log prefix,
    // so we use [docs] instead of [default]
    const pluginIdLogPrefix = pluginId === constants_1.DEFAULT_PLUGIN_ID ? '[docs]' : `[${pluginId}]`;
    if (!version) {
        throw new Error(`${pluginIdLogPrefix}: no version tag specified! Pass the version you wish to create as an argument, for example: 1.0.0.`);
    }
    if (version.includes('/') || version.includes('\\')) {
        throw new Error(`${pluginIdLogPrefix}: invalid version tag specified! Do not include slash (/) or backslash (\\). Try something like: 1.0.0.`);
    }
    if (version.length > 32) {
        throw new Error(`${pluginIdLogPrefix}: invalid version tag specified! Length cannot exceed 32 characters. Try something like: 1.0.0.`);
    }
    // Since we are going to create `version-${version}` folder, we need to make
    // sure it's a valid pathname.
    // eslint-disable-next-line no-control-regex
    if (/[<>:"|?*\x00-\x1F]/g.test(version)) {
        throw new Error(`${pluginIdLogPrefix}: invalid version tag specified! Please ensure its a valid pathname too. Try something like: 1.0.0.`);
    }
    if (/^\.\.?$/.test(version)) {
        throw new Error(`${pluginIdLogPrefix}: invalid version tag specified! Do not name your version "." or "..". Try something like: 1.0.0.`);
    }
    // Load existing versions.
    let versions = [];
    const versionsJSONFile = versions_1.getVersionsFilePath(siteDir, pluginId);
    if (fs_extra_1.default.existsSync(versionsJSONFile)) {
        versions = JSON.parse(fs_extra_1.default.readFileSync(versionsJSONFile, 'utf8'));
    }
    // Check if version already exists.
    if (versions.includes(version)) {
        throw new Error(`${pluginIdLogPrefix}: this version already exists! Use a version tag that does not already exist.`);
    }
    const { path: docsPath, sidebarPath } = options;
    // Copy docs files.
    const docsDir = path_1.default.join(siteDir, docsPath);
    if (fs_extra_1.default.existsSync(docsDir) && fs_extra_1.default.readdirSync(docsDir).length > 0) {
        const versionedDir = versions_1.getVersionedDocsDirPath(siteDir, pluginId);
        const newVersionDir = path_1.default.join(versionedDir, `version-${version}`);
        fs_extra_1.default.copySync(docsDir, newVersionDir);
    }
    else {
        throw new Error(`${pluginIdLogPrefix}: there is no docs to version!`);
    }
    createVersionedSidebarFile({
        siteDir,
        pluginId,
        version,
        sidebarPath: sidebars_1.resolveSidebarPathOption(siteDir, sidebarPath),
        options,
    });
    // Update versions.json file.
    versions.unshift(version);
    fs_extra_1.default.ensureDirSync(path_1.default.dirname(versionsJSONFile));
    fs_extra_1.default.writeFileSync(versionsJSONFile, `${JSON.stringify(versions, null, 2)}\n`);
    console.log(`${pluginIdLogPrefix}: version ${version} created!`);
}
exports.cliDocsVersionCommand = cliDocsVersionCommand;
