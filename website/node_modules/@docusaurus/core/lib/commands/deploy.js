"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const shelljs_1 = tslib_1.__importDefault(require("shelljs"));
const chalk_1 = tslib_1.__importDefault(require("chalk"));
const server_1 = require("../server");
const build_1 = tslib_1.__importDefault(require("./build"));
const path_1 = tslib_1.__importDefault(require("path"));
const os_1 = tslib_1.__importDefault(require("os"));
const buildRemoteBranchUrl_1 = require("./buildRemoteBranchUrl");
// GIT_PASS env variable should not appear in logs
function obfuscateGitPass(str) {
    const gitPass = process.env.GIT_PASS;
    return gitPass ? str.replace(gitPass, 'GIT_PASS') : str;
}
// Log executed commands so that user can figure out mistakes on his own
// for example: https://github.com/facebook/docusaurus/issues/3875
function shellExecLog(cmd) {
    try {
        const result = shelljs_1.default.exec(cmd);
        console.log(`${chalk_1.default.cyan('CMD:')} ${obfuscateGitPass(cmd)} ${chalk_1.default.cyan(`(code: ${result.code})`)}`);
        return result;
    }
    catch (e) {
        console.log(`${chalk_1.default.red('CMD:')} ${obfuscateGitPass(cmd)}`);
        throw e;
    }
}
async function deploy(siteDir, cliOptions = {}) {
    const { outDir, siteConfig, siteConfigPath } = await server_1.loadContext(siteDir, {
        customConfigFilePath: cliOptions.config,
        customOutDir: cliOptions.outDir,
    });
    if (typeof siteConfig.trailingSlash === 'undefined') {
        console.warn(chalk_1.default.yellow(`
Docusaurus recommendation:
When deploying to GitHub Pages, it is better to use an explicit "trailingSlash" site config.
Otherwise, GitHub Pages will add an extra trailing slash to your site urls only on direct-access (not when navigation) with a server redirect.
This behavior can have SEO impacts and create relative link issues.
`));
    }
    console.log('Deploy command invoked...');
    if (!shelljs_1.default.which('git')) {
        throw new Error('Git not installed or on the PATH!');
    }
    const gitUser = process.env.GIT_USER;
    if (!gitUser) {
        throw new Error('Please set the GIT_USER environment variable!');
    }
    // The branch that contains the latest docs changes that will be deployed.
    const currentBranch = process.env.CURRENT_BRANCH ||
        shelljs_1.default.exec('git rev-parse --abbrev-ref HEAD').stdout.trim();
    const organizationName = process.env.ORGANIZATION_NAME ||
        process.env.CIRCLE_PROJECT_USERNAME ||
        siteConfig.organizationName;
    if (!organizationName) {
        throw new Error(`Missing project organization name. Did you forget to define "organizationName" in ${siteConfigPath}? You may also export it via the ORGANIZATION_NAME environment variable.`);
    }
    console.log(`${chalk_1.default.cyan('organizationName:')} ${organizationName}`);
    const projectName = process.env.PROJECT_NAME ||
        process.env.CIRCLE_PROJECT_REPONAME ||
        siteConfig.projectName;
    if (!projectName) {
        throw new Error(`Missing project name. Did you forget to define "projectName" in ${siteConfigPath}? You may also export it via the PROJECT_NAME environment variable.`);
    }
    console.log(`${chalk_1.default.cyan('projectName:')} ${projectName}`);
    // We never deploy on pull request.
    const isPullRequest = process.env.CI_PULL_REQUEST || process.env.CIRCLE_PULL_REQUEST;
    if (isPullRequest) {
        shelljs_1.default.echo('Skipping deploy on a pull request.');
        shelljs_1.default.exit(0);
    }
    // github.io indicates organization repos that deploy via default branch. All others use gh-pages.
    // Organization deploys looks like:
    // - Git repo: https://github.com/<organization>/<organization>.github.io
    // - Site url: https://<organization>.github.io
    const isGitHubPagesOrganizationDeploy = projectName.indexOf('.github.io') !== -1;
    if (isGitHubPagesOrganizationDeploy && !process.env.DEPLOYMENT_BRANCH) {
        throw new Error(`For GitHub pages organization deployments, 'docusaurus deploy' does not assume anymore that 'master' is your default Git branch.
Please provide the branch name to deploy to as an environment variable.
Try using DEPLOYMENT_BRANCH=main or DEPLOYMENT_BRANCH=master`);
    }
    const deploymentBranch = process.env.DEPLOYMENT_BRANCH || 'gh-pages';
    console.log(`${chalk_1.default.cyan('deploymentBranch:')} ${deploymentBranch}`);
    const githubHost = process.env.GITHUB_HOST || siteConfig.githubHost || 'github.com';
    const githubPort = process.env.GITHUB_PORT || siteConfig.githubPort;
    const gitPass = process.env.GIT_PASS;
    let gitCredentials = `${gitUser}`;
    if (gitPass) {
        gitCredentials = `${gitCredentials}:${gitPass}`;
    }
    const useSSH = process.env.USE_SSH;
    const remoteBranch = buildRemoteBranchUrl_1.buildUrl(githubHost, githubPort, gitCredentials, organizationName, projectName, useSSH !== undefined && useSSH.toLowerCase() === 'true');
    console.log(`${chalk_1.default.cyan('Remote branch:')} ${obfuscateGitPass(remoteBranch)}`);
    // Check if this is a cross-repo publish.
    const currentRepoUrl = shelljs_1.default
        .exec('git config --get remote.origin.url')
        .stdout.trim();
    const crossRepoPublish = !currentRepoUrl.endsWith(`${organizationName}/${projectName}.git`);
    // We don't allow deploying to the same branch unless it's a cross publish.
    if (currentBranch === deploymentBranch && !crossRepoPublish) {
        throw new Error(`You cannot deploy from this branch (${currentBranch}).` +
            '\nYou will need to checkout to a different branch!');
    }
    // Save the commit hash that triggers publish-gh-pages before checking
    // out to deployment branch.
    const currentCommit = shellExecLog('git rev-parse HEAD').stdout.trim();
    const runDeploy = async (outputDirectory) => {
        const fromPath = outputDirectory;
        const toPath = await fs_extra_1.default.mkdtemp(path_1.default.join(os_1.default.tmpdir(), `${projectName}-${deploymentBranch}`));
        if (shellExecLog(`git clone ${remoteBranch} ${toPath}`).code !== 0) {
            throw new Error(`Running "git clone" command in "${toPath}" failed.`);
        }
        shelljs_1.default.cd(toPath);
        // If the default branch is the one we're deploying to, then we'll fail
        // to create it. This is the case of a cross-repo publish, where we clone
        // a github.io repo with a default branch.
        const defaultBranch = shelljs_1.default
            .exec('git rev-parse --abbrev-ref HEAD')
            .stdout.trim();
        if (defaultBranch !== deploymentBranch) {
            if (shellExecLog(`git checkout origin/${deploymentBranch}`).code !== 0) {
                if (shellExecLog(`git checkout --orphan ${deploymentBranch}`).code !== 0) {
                    throw new Error(`Running "git checkout ${deploymentBranch}" command failed.`);
                }
            }
            else if (shellExecLog(`git checkout -b ${deploymentBranch}`).code +
                shellExecLog(`git branch --set-upstream-to=origin/${deploymentBranch}`).code !==
                0) {
                throw new Error(`Running "git checkout ${deploymentBranch}" command failed.`);
            }
        }
        shellExecLog('git rm -rf .');
        try {
            await fs_extra_1.default.copy(fromPath, toPath);
        }
        catch (error) {
            throw new Error(`Copying build assets from "${fromPath}" to "${toPath}" failed with error "${error}".`);
        }
        shelljs_1.default.cd(toPath);
        shellExecLog('git add --all');
        const commitMessage = process.env.CUSTOM_COMMIT_MESSAGE ||
            `Deploy website - based on ${currentCommit}`;
        const commitResults = shellExecLog(`git commit -m "${commitMessage}"`);
        if (shellExecLog(`git push --force origin ${deploymentBranch}`).code !== 0) {
            throw new Error('Running "git push" command failed.');
        }
        else if (commitResults.code === 0) {
            // The commit might return a non-zero value when site is up to date.
            let websiteURL = '';
            if (githubHost === 'github.com') {
                websiteURL = projectName.includes('.github.io')
                    ? `https://${organizationName}.github.io/`
                    : `https://${organizationName}.github.io/${projectName}/`;
            }
            else {
                // GitHub enterprise hosting.
                websiteURL = `https://${githubHost}/pages/${organizationName}/${projectName}/`;
            }
            shelljs_1.default.echo(`Website is live at "${websiteURL}".`);
            shelljs_1.default.exit(0);
        }
    };
    if (!cliOptions.skipBuild) {
        // Build static html files, then push to deploymentBranch branch of specified repo.
        try {
            await runDeploy(await build_1.default(siteDir, cliOptions, false));
        }
        catch (buildError) {
            console.error(buildError);
            process.exit(1);
        }
    }
    else {
        // Push current build to deploymentBranch branch of specified repo.
        await runDeploy(outDir);
    }
}
exports.default = deploy;
