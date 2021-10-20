"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.getFileLastUpdate = void 0;
const tslib_1 = require("tslib");
const shelljs_1 = tslib_1.__importDefault(require("shelljs"));
const execa_1 = tslib_1.__importDefault(require("execa"));
const path_1 = tslib_1.__importDefault(require("path"));
const GIT_COMMIT_TIMESTAMP_AUTHOR_REGEX = /^(\d+), (.+)$/;
let showedGitRequirementError = false;
async function getFileLastUpdate(filePath) {
    if (!filePath) {
        return null;
    }
    function getTimestampAndAuthor(str) {
        if (!str) {
            return null;
        }
        const temp = str.match(GIT_COMMIT_TIMESTAMP_AUTHOR_REGEX);
        return !temp || temp.length < 3
            ? null
            : { timestamp: +temp[1], author: temp[2] };
    }
    // Wrap in try/catch in case the shell commands fail
    // (e.g. project doesn't use Git, etc).
    try {
        if (!shelljs_1.default.which('git')) {
            if (!showedGitRequirementError) {
                showedGitRequirementError = true;
                console.warn('Sorry, the docs plugin last update options require Git.');
            }
            return null;
        }
        const fileBasename = path_1.default.basename(filePath);
        const fileDirname = path_1.default.dirname(filePath);
        const { stdout } = await execa_1.default('git', ['log', '-1', '--format=%ct, %an', fileBasename], {
            cwd: fileDirname,
        });
        return getTimestampAndAuthor(stdout);
    }
    catch (error) {
        console.error(error);
    }
    return null;
}
exports.getFileLastUpdate = getFileLastUpdate;
