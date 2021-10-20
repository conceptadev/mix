/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const codeBlockTitleRegex = /title=(["'])(.*?)\1/;
export function parseCodeBlockTitle(metastring) {
    var _a, _b;
    return (_b = (_a = metastring === null || metastring === void 0 ? void 0 : metastring.match(codeBlockTitleRegex)) === null || _a === void 0 ? void 0 : _a[2]) !== null && _b !== void 0 ? _b : '';
}
