"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const chalk_1 = tslib_1.__importDefault(require("chalk"));
const copy_webpack_plugin_1 = tslib_1.__importDefault(require("copy-webpack-plugin"));
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const path_1 = tslib_1.__importDefault(require("path"));
const react_loadable_ssr_addon_v5_slorber_1 = tslib_1.__importDefault(require("react-loadable-ssr-addon-v5-slorber"));
const webpack_bundle_analyzer_1 = require("webpack-bundle-analyzer");
const webpack_merge_1 = tslib_1.__importDefault(require("webpack-merge"));
const constants_1 = require("../constants");
const server_1 = require("../server");
const brokenLinks_1 = require("../server/brokenLinks");
const client_1 = tslib_1.__importDefault(require("../webpack/client"));
const server_2 = tslib_1.__importDefault(require("../webpack/server"));
const utils_1 = require("../webpack/utils");
const CleanWebpackPlugin_1 = tslib_1.__importDefault(require("../webpack/plugins/CleanWebpackPlugin"));
const i18n_1 = require("../server/i18n");
const utils_2 = require("@docusaurus/utils");
async function build(siteDir, cliOptions = {}, 
// TODO what's the purpose of this arg ?
forceTerminate = true) {
    async function tryToBuildLocale({ locale, isLastLocale, }) {
        try {
            // console.log(chalk.green(`Site successfully built in locale=${locale}`));
            return await buildLocale({
                siteDir,
                locale,
                cliOptions,
                forceTerminate,
                isLastLocale,
            });
        }
        catch (e) {
            console.error(`Unable to build website for locale "${locale}".`);
            throw e;
        }
    }
    const context = await server_1.loadContext(siteDir, {
        customOutDir: cliOptions.outDir,
        customConfigFilePath: cliOptions.config,
        locale: cliOptions.locale,
        localizePath: cliOptions.locale ? false : undefined,
    });
    const i18n = await i18n_1.loadI18n(context.siteConfig, {
        locale: cliOptions.locale,
    });
    if (cliOptions.locale) {
        return tryToBuildLocale({ locale: cliOptions.locale, isLastLocale: true });
    }
    else {
        if (i18n.locales.length > 1) {
            console.log(chalk_1.default.yellow(`\nWebsite will be built for all these locales:
- ${i18n.locales.join('\n- ')}`));
        }
        // We need the default locale to always be the 1st in the list
        // If we build it last, it would "erase" the localized sites built in subfolders
        const orderedLocales = [
            i18n.defaultLocale,
            ...i18n.locales.filter((locale) => locale !== i18n.defaultLocale),
        ];
        const results = await utils_2.mapAsyncSequencial(orderedLocales, (locale) => {
            const isLastLocale = orderedLocales.indexOf(locale) === orderedLocales.length - 1;
            return tryToBuildLocale({ locale, isLastLocale });
        });
        return results[0];
    }
}
exports.default = build;
async function buildLocale({ siteDir, locale, cliOptions, forceTerminate, isLastLocale, }) {
    process.env.BABEL_ENV = 'production';
    process.env.NODE_ENV = 'production';
    console.log(chalk_1.default.blue(`\n[${locale}] Creating an optimized production build...`));
    const props = await server_1.load(siteDir, {
        customOutDir: cliOptions.outDir,
        customConfigFilePath: cliOptions.config,
        locale,
        localizePath: cliOptions.locale ? false : undefined,
    });
    // Apply user webpack config.
    const { outDir, generatedFilesDir, plugins, siteConfig: { baseUrl, onBrokenLinks }, routes, } = props;
    const clientManifestPath = path_1.default.join(generatedFilesDir, 'client-manifest.json');
    let clientConfig = webpack_merge_1.default(client_1.default(props, cliOptions.minify), {
        plugins: [
            // Remove/clean build folders before building bundles.
            new CleanWebpackPlugin_1.default({ verbose: false }),
            // Visualize size of webpack output files with an interactive zoomable treemap.
            cliOptions.bundleAnalyzer && new webpack_bundle_analyzer_1.BundleAnalyzerPlugin(),
            // Generate client manifests file that will be used for server bundle.
            new react_loadable_ssr_addon_v5_slorber_1.default({
                filename: clientManifestPath,
            }),
        ].filter(Boolean),
    });
    const allCollectedLinks = {};
    let serverConfig = server_2.default({
        props,
        onLinksCollected: (staticPagePath, links) => {
            allCollectedLinks[staticPagePath] = links;
        },
    });
    const staticDir = path_1.default.resolve(siteDir, constants_1.STATIC_DIR_NAME);
    if (await fs_extra_1.default.pathExists(staticDir)) {
        serverConfig = webpack_merge_1.default(serverConfig, {
            plugins: [
                new copy_webpack_plugin_1.default({
                    patterns: [
                        {
                            from: staticDir,
                            to: outDir,
                        },
                    ],
                }),
            ],
        });
    }
    // Plugin Lifecycle - configureWebpack and configurePostCss.
    plugins.forEach((plugin) => {
        var _a, _b;
        const { configureWebpack, configurePostCss } = plugin;
        if (configurePostCss) {
            clientConfig = utils_1.applyConfigurePostCss(configurePostCss, clientConfig);
        }
        if (configureWebpack) {
            clientConfig = utils_1.applyConfigureWebpack(configureWebpack.bind(plugin), // The plugin lifecycle may reference `this`. // TODO remove this implicit api: inject in callback instead
            clientConfig, false, (_a = props.siteConfig.webpack) === null || _a === void 0 ? void 0 : _a.jsLoader, plugin.content);
            serverConfig = utils_1.applyConfigureWebpack(configureWebpack.bind(plugin), // The plugin lifecycle may reference `this`. // TODO remove this implicit api: inject in callback instead
            serverConfig, true, (_b = props.siteConfig.webpack) === null || _b === void 0 ? void 0 : _b.jsLoader, plugin.content);
        }
    });
    // Make sure generated client-manifest is cleaned first so we don't reuse
    // the one from previous builds.
    if (await fs_extra_1.default.pathExists(clientManifestPath)) {
        await fs_extra_1.default.unlink(clientManifestPath);
    }
    // Run webpack to build JS bundle (client) and static html files (server).
    await utils_1.compile([clientConfig, serverConfig]);
    // Remove server.bundle.js because it is not needed.
    if (serverConfig.output &&
        serverConfig.output.filename &&
        typeof serverConfig.output.filename === 'string') {
        const serverBundle = path_1.default.join(outDir, serverConfig.output.filename);
        if (await fs_extra_1.default.pathExists(serverBundle)) {
            await fs_extra_1.default.unlink(serverBundle);
        }
    }
    // Plugin Lifecycle - postBuild.
    await Promise.all(plugins.map(async (plugin) => {
        if (!plugin.postBuild) {
            return;
        }
        await plugin.postBuild(props);
    }));
    await brokenLinks_1.handleBrokenLinks({
        allCollectedLinks,
        routes,
        onBrokenLinks,
        outDir,
        baseUrl,
    });
    console.log(`${chalk_1.default.green(`Success!`)} Generated static files in "${chalk_1.default.cyan(path_1.default.relative(process.cwd(), outDir))}".`);
    if (isLastLocale) {
        console.log(`\nUse ${chalk_1.default.greenBright('`npm run serve`')} command to test your build locally.\n`);
    }
    if (forceTerminate && isLastLocale && !cliOptions.bundleAnalyzer) {
        process.exit(0);
    }
    return outDir;
}
