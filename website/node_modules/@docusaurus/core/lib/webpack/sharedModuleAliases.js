"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const module_alias_1 = tslib_1.__importDefault(require("module-alias"));
// The shared module aliases are module aliases that need to work in both SSR/NodeJS + Webpack
const SharedModuleAliases = {
    // Useful to fix the react-loadable warning
    // See https://github.com/jamiebuilds/react-loadable/pull/213#issuecomment-778246548
    'react-loadable': '@docusaurus/react-loadable',
};
module_alias_1.default.addAliases(SharedModuleAliases);
exports.default = SharedModuleAliases;
