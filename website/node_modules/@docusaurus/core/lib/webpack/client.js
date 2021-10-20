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
const path_1 = tslib_1.__importDefault(require("path"));
const webpack_merge_1 = tslib_1.__importDefault(require("webpack-merge"));
const base_1 = require("./base");
const ChunkAssetPlugin_1 = tslib_1.__importDefault(require("./plugins/ChunkAssetPlugin"));
const LogPlugin_1 = tslib_1.__importDefault(require("./plugins/LogPlugin"));
function createClientConfig(props, minify = true) {
    var _a;
    const isProd = process.env.NODE_ENV === 'production';
    const isBuilding = process.argv[2] === 'build';
    const config = base_1.createBaseConfig(props, false, minify);
    const clientConfig = webpack_merge_1.default(config, {
        // target: 'browserslist', //  useless, disabled on purpose (errors on existing sites with no browserslist cfg)
        entry: [
            // Instead of the default WebpackDevServer client, we use a custom one
            // like CRA to bring better experience.
            // note: the one in ./dev is modified to work with Docusaurus
            // !isProd && require.resolve('react-dev-utils/hotDevServer.js'),
            !isProd &&
                require.resolve('./react-dev-utils-webpack5/webpackHotDevClient.js'),
            path_1.default.resolve(__dirname, '../client/clientEntry.js'),
        ].filter(Boolean),
        optimization: {
            // Keep the runtime chunk separated to enable long term caching
            // https://twitter.com/wSokra/status/969679223278505985
            runtimeChunk: true,
        },
        plugins: [
            new ChunkAssetPlugin_1.default(),
            // Show compilation progress bar and build time.
            new LogPlugin_1.default({
                name: 'Client',
            }),
        ],
    });
    // When building include the plugin to force terminate building if errors happened in the client bundle.
    if (isBuilding) {
        (_a = clientConfig.plugins) === null || _a === void 0 ? void 0 : _a.push({
            apply: (compiler) => {
                compiler.hooks.done.tap('client:done', (stats) => {
                    if (stats.hasErrors()) {
                        console.log(chalk_1.default.red('Client bundle compiled with errors therefore further build is impossible.'));
                        process.exit(1);
                    }
                });
            },
        });
    }
    return clientConfig;
}
exports.default = createClientConfig;
