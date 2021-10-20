"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.loadPluginsThemeAliases = exports.loadThemeAliases = void 0;
const tslib_1 = require("tslib");
const path_1 = tslib_1.__importDefault(require("path"));
const constants_1 = require("../../constants");
const alias_1 = tslib_1.__importStar(require("./alias"));
const ThemeFallbackDir = path_1.default.resolve(__dirname, '../../client/theme-fallback');
function buildThemeAliases(themeAliases, aliases = {}) {
    Object.keys(themeAliases).forEach((aliasKey) => {
        if (aliasKey in aliases) {
            const componentName = aliasKey.substring(aliasKey.indexOf('/') + 1);
            // eslint-disable-next-line no-param-reassign
            aliases[`@theme-init/${componentName}`] = aliases[aliasKey];
        }
        // eslint-disable-next-line no-param-reassign
        aliases[aliasKey] = themeAliases[aliasKey];
    });
    return aliases;
}
function loadThemeAliases(themePaths, userThemePaths = []) {
    let aliases = {}; // TODO refactor, inelegant side-effect
    themePaths.forEach((themePath) => {
        const themeAliases = alias_1.default(themePath, true);
        aliases = { ...aliases, ...buildThemeAliases(themeAliases, aliases) };
    });
    userThemePaths.forEach((themePath) => {
        const userThemeAliases = alias_1.default(themePath, false);
        aliases = { ...aliases, ...buildThemeAliases(userThemeAliases, aliases) };
    });
    return alias_1.sortAliases(aliases);
}
exports.loadThemeAliases = loadThemeAliases;
function loadPluginsThemeAliases({ siteDir, plugins, }) {
    const pluginThemes = plugins
        .map((plugin) => (plugin.getThemePath ? plugin.getThemePath() : undefined))
        .filter((x) => Boolean(x));
    const userTheme = path_1.default.resolve(siteDir, constants_1.THEME_PATH);
    return loadThemeAliases([ThemeFallbackDir, ...pluginThemes], [userTheme]);
}
exports.loadPluginsThemeAliases = loadPluginsThemeAliases;
