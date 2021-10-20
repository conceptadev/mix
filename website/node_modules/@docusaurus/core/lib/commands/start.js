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
const chalk = require("chalk");
const chokidar_1 = tslib_1.__importDefault(require("chokidar"));
const express_1 = tslib_1.__importDefault(require("express"));
const html_webpack_plugin_1 = tslib_1.__importDefault(require("html-webpack-plugin"));
const path_1 = tslib_1.__importDefault(require("path"));
const lodash_1 = require("lodash");
const openBrowser_1 = tslib_1.__importDefault(require("react-dev-utils/openBrowser"));
const WebpackDevServerUtils_1 = require("react-dev-utils/WebpackDevServerUtils");
const errorOverlayMiddleware_1 = tslib_1.__importDefault(require("react-dev-utils/errorOverlayMiddleware"));
// import evalSourceMapMiddleware from 'react-dev-utils/evalSourceMapMiddleware';
const evalSourceMapMiddleware_1 = tslib_1.__importDefault(require("../webpack/react-dev-utils-webpack5/evalSourceMapMiddleware"));
const webpack_1 = tslib_1.__importDefault(require("webpack"));
const webpack_dev_server_1 = tslib_1.__importDefault(require("webpack-dev-server"));
const webpack_merge_1 = tslib_1.__importDefault(require("webpack-merge"));
const HotModuleReplacementPlugin_1 = tslib_1.__importDefault(require("webpack/lib/HotModuleReplacementPlugin"));
const server_1 = require("../server");
const constants_1 = require("../constants");
const client_1 = tslib_1.__importDefault(require("../webpack/client"));
const utils_2 = require("../webpack/utils");
const commandUtils_1 = require("./commandUtils");
const translations_1 = require("../server/translations/translations");
async function start(siteDir, cliOptions) {
    process.env.NODE_ENV = 'development';
    process.env.BABEL_ENV = 'development';
    console.log(chalk.blue('Starting the development server...'));
    function loadSite() {
        return server_1.load(siteDir, {
            customConfigFilePath: cliOptions.config,
            locale: cliOptions.locale,
            localizePath: undefined, // should this be configurable?
        });
    }
    // Process all related files as a prop.
    const props = await loadSite();
    const protocol = process.env.HTTPS === 'true' ? 'https' : 'http';
    const host = commandUtils_1.getCLIOptionHost(cliOptions.host);
    const port = await commandUtils_1.getCLIOptionPort(cliOptions.port, host);
    if (port === null) {
        process.exit();
    }
    const { baseUrl, headTags, preBodyTags, postBodyTags } = props;
    const urls = WebpackDevServerUtils_1.prepareUrls(protocol, host, port);
    const openUrl = utils_1.normalizeUrl([urls.localUrlForBrowser, baseUrl]);
    console.log(chalk.cyanBright(`Docusaurus website is running at "${openUrl}".`));
    // Reload files processing.
    const reload = lodash_1.debounce(() => {
        loadSite()
            .then(({ baseUrl: newBaseUrl }) => {
            const newOpenUrl = utils_1.normalizeUrl([urls.localUrlForBrowser, newBaseUrl]);
            if (newOpenUrl !== openUrl) {
                console.log(chalk.cyanBright(`Docusaurus website is running at "${newOpenUrl}".`));
            }
        })
            .catch((err) => {
            console.error(chalk.red(err.stack));
        });
    }, 500);
    const { siteConfig, plugins = [] } = props;
    const normalizeToSiteDir = (filepath) => {
        if (filepath && path_1.default.isAbsolute(filepath)) {
            return utils_1.posixPath(path_1.default.relative(siteDir, filepath));
        }
        return utils_1.posixPath(filepath);
    };
    const pluginPaths = []
        .concat(...plugins
        .map((plugin) => { var _a, _b; return (_b = (_a = plugin.getPathsToWatch) === null || _a === void 0 ? void 0 : _a.call(plugin)) !== null && _b !== void 0 ? _b : []; })
        .filter(Boolean))
        .map(normalizeToSiteDir);
    const pathsToWatch = [
        ...pluginPaths,
        props.siteConfigPath,
        translations_1.getTranslationsLocaleDirPath({
            siteDir,
            locale: props.i18n.currentLocale,
        }),
    ];
    const fsWatcher = chokidar_1.default.watch(pathsToWatch, {
        cwd: siteDir,
        ignoreInitial: true,
        usePolling: !!cliOptions.poll,
        interval: Number.isInteger(cliOptions.poll)
            ? cliOptions.poll
            : undefined,
    });
    ['add', 'change', 'unlink', 'addDir', 'unlinkDir'].forEach((event) => fsWatcher.on(event, reload));
    let config = webpack_merge_1.default(client_1.default(props), {
        plugins: [
            // Generates an `index.html` file with the <script> injected.
            new html_webpack_plugin_1.default({
                template: path_1.default.resolve(__dirname, '../client/templates/index.html.template.ejs'),
                // So we can define the position where the scripts are injected.
                inject: false,
                filename: 'index.html',
                title: siteConfig.title,
                headTags,
                preBodyTags,
                postBodyTags,
            }),
            // This is necessary to emit hot updates for webpack-dev-server.
            new HotModuleReplacementPlugin_1.default(),
        ],
    });
    // Plugin Lifecycle - configureWebpack and configurePostCss.
    plugins.forEach((plugin) => {
        var _a;
        const { configureWebpack, configurePostCss } = plugin;
        if (configurePostCss) {
            config = utils_2.applyConfigurePostCss(configurePostCss, config);
        }
        if (configureWebpack) {
            config = utils_2.applyConfigureWebpack(configureWebpack.bind(plugin), // The plugin lifecycle may reference `this`. // TODO remove this implicit api: inject in callback instead
            config, false, (_a = props.siteConfig.webpack) === null || _a === void 0 ? void 0 : _a.jsLoader, plugin.content);
        }
    });
    // https://webpack.js.org/configuration/dev-server
    const devServerConfig = {
        ...{
            compress: true,
            clientLogLevel: 'error',
            hot: true,
            hotOnly: cliOptions.hotOnly,
            // Use 'ws' instead of 'sockjs-node' on server since we're using native
            // websockets in `webpackHotDevClient`.
            transportMode: 'ws',
            // Prevent a WS client from getting injected as we're already including
            // `webpackHotDevClient`.
            injectClient: false,
            quiet: true,
            https: utils_2.getHttpsConfig(),
            headers: {
                'access-control-allow-origin': '*',
            },
            publicPath: baseUrl,
            watchOptions: {
                poll: cliOptions.poll,
                // Useful options for our own monorepo using symlinks!
                // See https://github.com/webpack/webpack/issues/11612#issuecomment-879259806
                followSymlinks: true,
                ignored: /node_modules\/(?!@docusaurus)/,
            },
            historyApiFallback: {
                rewrites: [{ from: /\/*/, to: baseUrl }],
            },
            disableHostCheck: true,
            // Disable overlay on browser since we use CRA's overlay error reporting.
            overlay: false,
            host,
            before: (app, server) => {
                app.use(baseUrl, express_1.default.static(path_1.default.resolve(siteDir, constants_1.STATIC_DIR_NAME)));
                // This lets us fetch source contents from webpack for the error overlay.
                app.use(evalSourceMapMiddleware_1.default(server));
                // This lets us open files from the runtime error overlay.
                app.use(errorOverlayMiddleware_1.default());
            },
        },
    };
    const compiler = webpack_1.default(config);
    if (process.env.E2E_TEST) {
        compiler.hooks.done.tap('done', (stats) => {
            if (stats.hasErrors()) {
                console.log('E2E_TEST: Project has compiler errors.');
                process.exit(1);
            }
            console.log('E2E_TEST: Project can compile.');
            process.exit(0);
        });
    }
    const devServer = new webpack_dev_server_1.default(compiler, devServerConfig);
    devServer.listen(port, host, (err) => {
        if (err) {
            console.log(err);
        }
        if (cliOptions.open) {
            openBrowser_1.default(openUrl);
        }
    });
    ['SIGINT', 'SIGTERM'].forEach((sig) => {
        process.on(sig, () => {
            devServer.close();
            process.exit();
        });
    });
}
exports.default = start;
