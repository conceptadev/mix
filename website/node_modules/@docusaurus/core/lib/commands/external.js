"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const server_1 = require("../server");
const init_1 = tslib_1.__importDefault(require("../server/plugins/init"));
async function externalCommand(cli, siteDir) {
    const context = await server_1.loadContext(siteDir);
    const pluginConfigs = server_1.loadPluginConfigs(context);
    const plugins = init_1.default({ pluginConfigs, context });
    // Plugin Lifecycle - extendCli.
    plugins.forEach((plugin) => {
        const { extendCli } = plugin;
        if (!extendCli) {
            return;
        }
        extendCli(cli);
    });
}
exports.default = externalCommand;
