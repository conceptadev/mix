"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.buildUrl = void 0;
function buildUrl(githubHost, githubPort, gitCredentials, organizationName, projectName, useSSH) {
    return useSSH
        ? buildSshUrl(githubHost, organizationName, projectName, githubPort)
        : buildHttpsUrl(gitCredentials, githubHost, organizationName, projectName, githubPort);
}
exports.buildUrl = buildUrl;
function buildSshUrl(githubHost, organizationName, projectName, githubPort) {
    if (githubPort) {
        return `ssh://git@${githubHost}:${githubPort}/${organizationName}/${projectName}.git`;
    }
    return `git@${githubHost}:${organizationName}/${projectName}.git`;
}
function buildHttpsUrl(gitCredentials, githubHost, organizationName, projectName, githubPort) {
    if (githubPort) {
        return `https://${gitCredentials}@${githubHost}:${githubPort}/${organizationName}/${projectName}.git`;
    }
    return `https://${gitCredentials}@${githubHost}/${organizationName}/${projectName}.git`;
}
