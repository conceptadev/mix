"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.getMinimizer = exports.getHttpsConfig = exports.getFileLoaderUtils = exports.compile = exports.applyConfigurePostCss = exports.applyConfigureWebpack = exports.getCustomizableJSLoader = exports.getBabelOptions = exports.getCustomBabelConfigFilePath = exports.getStyleLoaders = void 0;
const tslib_1 = require("tslib");
const mini_css_extract_plugin_1 = tslib_1.__importDefault(require("mini-css-extract-plugin"));
const webpack_merge_1 = require("webpack-merge");
const webpack_1 = tslib_1.__importDefault(require("webpack"));
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
const terser_webpack_plugin_1 = tslib_1.__importDefault(require("terser-webpack-plugin"));
const css_minimizer_webpack_plugin_1 = tslib_1.__importDefault(require("css-minimizer-webpack-plugin"));
const path_1 = tslib_1.__importDefault(require("path"));
const crypto_1 = tslib_1.__importDefault(require("crypto"));
const chalk_1 = tslib_1.__importDefault(require("chalk"));
const constants_1 = require("../constants");
const lodash_1 = require("lodash");
// Utility method to get style loaders
function getStyleLoaders(isServer, cssOptions = {}) {
    if (isServer) {
        return cssOptions.modules
            ? [
                {
                    loader: require.resolve('css-loader'),
                    options: cssOptions,
                },
            ]
            : [
                {
                    loader: mini_css_extract_plugin_1.default.loader,
                    options: {
                        // Don't emit CSS files for SSR (previously used null-loader)
                        // See https://github.com/webpack-contrib/mini-css-extract-plugin/issues/90#issuecomment-811991738
                        emit: false,
                    },
                },
                {
                    loader: require.resolve('css-loader'),
                    options: cssOptions,
                },
            ];
    }
    return [
        {
            loader: mini_css_extract_plugin_1.default.loader,
            options: {
                esModule: true,
            },
        },
        {
            loader: require.resolve('css-loader'),
            options: cssOptions,
        },
        {
            // Options for PostCSS as we reference these options twice
            // Adds vendor prefixing based on your specified browser support in
            // package.json
            loader: require.resolve('postcss-loader'),
            options: {
                postcssOptions: {
                    // Necessary for external CSS imports to work
                    // https://github.com/facebook/create-react-app/issues/2677
                    ident: 'postcss',
                    plugins: [
                        // eslint-disable-next-line @typescript-eslint/no-var-requires, global-require
                        require('autoprefixer'),
                    ],
                },
            },
        },
    ];
}
exports.getStyleLoaders = getStyleLoaders;
function getCustomBabelConfigFilePath(siteDir) {
    const customBabelConfigurationPath = path_1.default.join(siteDir, constants_1.BABEL_CONFIG_FILE_NAME);
    return fs_extra_1.default.existsSync(customBabelConfigurationPath)
        ? customBabelConfigurationPath
        : undefined;
}
exports.getCustomBabelConfigFilePath = getCustomBabelConfigFilePath;
function getBabelOptions({ isServer, babelOptions, } = {}) {
    if (typeof babelOptions === 'string') {
        return {
            babelrc: false,
            configFile: babelOptions,
            caller: { name: isServer ? 'server' : 'client' },
        };
    }
    else {
        return Object.assign(babelOptions !== null && babelOptions !== void 0 ? babelOptions : { presets: [require.resolve('../babel/preset')] }, {
            babelrc: false,
            configFile: false,
            caller: { name: isServer ? 'server' : 'client' },
        });
    }
}
exports.getBabelOptions = getBabelOptions;
// Name is generic on purpose
// we want to support multiple js loader implementations (babel + esbuild)
function getDefaultBabelLoader({ isServer, babelOptions, }) {
    return {
        loader: require.resolve('babel-loader'),
        options: getBabelOptions({ isServer, babelOptions }),
    };
}
const getCustomizableJSLoader = (jsLoader = 'babel') => ({ isServer, babelOptions, }) => jsLoader === 'babel'
    ? getDefaultBabelLoader({ isServer, babelOptions })
    : jsLoader(isServer);
exports.getCustomizableJSLoader = getCustomizableJSLoader;
// TODO remove this before end of 2021?
const warnBabelLoaderOnce = lodash_1.memoize(function () {
    console.warn(chalk_1.default.yellow('Docusaurus plans to support multiple JS loader strategies (Babel, esbuild...): "getBabelLoader(isServer)" is now deprecated in favor of "getJSLoader({isServer})".'));
});
const getBabelLoaderDeprecated = function getBabelLoaderDeprecated(isServer, babelOptions) {
    warnBabelLoaderOnce();
    return getDefaultBabelLoader({ isServer, babelOptions });
};
// TODO remove this before end of 2021 ?
const warnCacheLoaderOnce = lodash_1.memoize(function () {
    console.warn(chalk_1.default.yellow('Docusaurus uses Webpack 5 and getCacheLoader() usage is now deprecated.'));
});
function getCacheLoaderDeprecated() {
    warnCacheLoaderOnce();
    return null;
}
/**
 * Helper function to modify webpack config
 * @param configureWebpack a webpack config or a function to modify config
 * @param config initial webpack config
 * @param isServer indicates if this is a server webpack configuration
 * @param jsLoader custom js loader config
 * @param content content loaded by the plugin
 * @returns final/ modified webpack config
 */
function applyConfigureWebpack(configureWebpack, config, isServer, jsLoader, content) {
    // Export some utility functions
    const utils = {
        getStyleLoaders,
        getJSLoader: exports.getCustomizableJSLoader(jsLoader),
        getBabelLoader: getBabelLoaderDeprecated,
        getCacheLoader: getCacheLoaderDeprecated,
    };
    if (typeof configureWebpack === 'function') {
        const { mergeStrategy, ...res } = configureWebpack(config, isServer, utils, content);
        if (res && typeof res === 'object') {
            // @ts-expect-error: annoying error due to enums: https://github.com/survivejs/webpack-merge/issues/179
            const customizeRules = mergeStrategy !== null && mergeStrategy !== void 0 ? mergeStrategy : {};
            return webpack_merge_1.mergeWithCustomize({
                customizeArray: webpack_merge_1.customizeArray(customizeRules),
                customizeObject: webpack_merge_1.customizeObject(customizeRules),
            })(config, res);
        }
    }
    return config;
}
exports.applyConfigureWebpack = applyConfigureWebpack;
function applyConfigurePostCss(configurePostCss, config) {
    var _a, _b;
    // TODO not ideal heuristic but good enough for our usecase?
    function isPostCssLoader(loader) {
        var _a, _b;
        return !!((_b = (_a = loader) === null || _a === void 0 ? void 0 : _a.options) === null || _b === void 0 ? void 0 : _b.postcssOptions);
    }
    // Does not handle all edge cases, but good enough for now
    function overridePostCssOptions(entry) {
        if (isPostCssLoader(entry)) {
            entry.options.postcssOptions = configurePostCss(entry.options.postcssOptions);
        }
        else if (Array.isArray(entry.oneOf)) {
            entry.oneOf.forEach(overridePostCssOptions);
        }
        else if (Array.isArray(entry.use)) {
            entry.use
                .filter((u) => typeof u === 'object')
                .forEach(overridePostCssOptions);
        }
    }
    (_b = (_a = config.module) === null || _a === void 0 ? void 0 : _a.rules) === null || _b === void 0 ? void 0 : _b.forEach(overridePostCssOptions);
    return config;
}
exports.applyConfigurePostCss = applyConfigurePostCss;
function compile(config) {
    return new Promise((resolve, reject) => {
        const compiler = webpack_1.default(config);
        compiler.run((err, stats) => {
            var _a;
            if (err) {
                console.error(err.stack || err);
                // @ts-expect-error: see https://webpack.js.org/api/node/#error-handling
                if (err.details) {
                    // @ts-expect-error: see https://webpack.js.org/api/node/#error-handling
                    console.error(err.details);
                }
                reject(err);
            }
            // let plugins consume all the stats
            const errorsWarnings = stats === null || stats === void 0 ? void 0 : stats.toJson('errors-warnings');
            if (stats === null || stats === void 0 ? void 0 : stats.hasErrors()) {
                reject(new Error('Failed to compile with errors.'));
            }
            if (errorsWarnings && (stats === null || stats === void 0 ? void 0 : stats.hasWarnings())) {
                (_a = errorsWarnings.warnings) === null || _a === void 0 ? void 0 : _a.forEach((warning) => {
                    console.warn(warning);
                });
            }
            // Webpack 5 requires calling close() so that persistent caching works
            // See https://github.com/webpack/webpack.js.org/pull/4775
            compiler.close((errClose) => {
                if (errClose) {
                    console.error(chalk_1.default.red('Error while closing Webpack compiler:', errClose));
                    reject(errClose);
                }
                else {
                    resolve();
                }
            });
        });
    });
}
exports.compile = compile;
// Inspired by https://github.com/gatsbyjs/gatsby/blob/8e6e021014da310b9cc7d02e58c9b3efe938c665/packages/gatsby/src/utils/webpack-utils.ts#L447
function getFileLoaderUtils() {
    // files/images < 10kb will be inlined as base64 strings directly in the html
    const urlLoaderLimit = 10000;
    // defines the path/pattern of the assets handled by webpack
    const fileLoaderFileName = (folder) => `${constants_1.OUTPUT_STATIC_ASSETS_DIR_NAME}/${folder}/[name]-[hash].[ext]`;
    const loaders = {
        file: (options) => {
            return {
                loader: require.resolve(`file-loader`),
                options: {
                    name: fileLoaderFileName(options.folder),
                },
            };
        },
        url: (options) => {
            return {
                loader: require.resolve(`url-loader`),
                options: {
                    limit: urlLoaderLimit,
                    name: fileLoaderFileName(options.folder),
                    fallback: require.resolve(`file-loader`),
                },
            };
        },
        // TODO find a better solution to avoid conflicts with the ideal-image plugin
        // TODO this may require a little breaking change for ideal-image users?
        // Maybe with the ideal image plugin, all md images should be "ideal"?
        // This is used to force url-loader+file-loader on markdown images
        // https://webpack.js.org/concepts/loaders/#inline
        inlineMarkdownImageFileLoader: `!url-loader?limit=${urlLoaderLimit}&name=${fileLoaderFileName('images')}&fallback=file-loader!`,
        inlineMarkdownLinkFileLoader: `!file-loader?name=${fileLoaderFileName('files')}!`,
    };
    const rules = {
        /**
         * Loads image assets, inlines images via a data URI if they are below
         * the size threshold
         */
        images: () => {
            return {
                use: [loaders.url({ folder: 'images' })],
                test: /\.(ico|jpg|jpeg|png|gif|webp)(\?.*)?$/,
            };
        },
        fonts: () => {
            return {
                use: [loaders.url({ folder: 'fonts' })],
                test: /\.(woff|woff2|eot|ttf|otf)$/,
            };
        },
        /**
         * Loads audio and video and inlines them via a data URI if they are below
         * the size threshold
         */
        media: () => {
            return {
                use: [loaders.url({ folder: 'medias' })],
                test: /\.(mp4|webm|ogv|wav|mp3|m4a|aac|oga|flac)$/,
            };
        },
        svg: () => {
            return {
                test: /\.svg?$/,
                oneOf: [
                    {
                        use: [
                            {
                                loader: '@svgr/webpack',
                                options: {
                                    prettier: false,
                                    svgo: true,
                                    svgoConfig: {
                                        plugins: [{ removeViewBox: false }],
                                    },
                                    titleProp: true,
                                    ref: ![path_1.default],
                                },
                            },
                        ],
                        // We don't want to use SVGR loader for non-React source code
                        // ie we don't want to use SVGR for CSS files...
                        issuer: {
                            and: [/\.(ts|tsx|js|jsx|md|mdx)$/],
                        },
                    },
                    {
                        use: [loaders.url({ folder: 'images' })],
                    },
                ],
            };
        },
        otherAssets: () => {
            return {
                use: [loaders.file({ folder: 'files' })],
                test: /\.(pdf|doc|docx|xls|xlsx|zip|rar)$/,
            };
        },
    };
    return { loaders, rules };
}
exports.getFileLoaderUtils = getFileLoaderUtils;
// Ensure the certificate and key provided are valid and if not
// throw an easy to debug error
function validateKeyAndCerts({ cert, key, keyFile, crtFile }) {
    let encrypted;
    try {
        // publicEncrypt will throw an error with an invalid cert
        encrypted = crypto_1.default.publicEncrypt(cert, Buffer.from('test'));
    }
    catch (err) {
        throw new Error(`The certificate "${chalk_1.default.yellow(crtFile)}" is invalid.\n${err.message}`);
    }
    try {
        // privateDecrypt will throw an error with an invalid key
        crypto_1.default.privateDecrypt(key, encrypted);
    }
    catch (err) {
        throw new Error(`The certificate key "${chalk_1.default.yellow(keyFile)}" is invalid.\n${err.message}`);
    }
}
// Read file and throw an error if it doesn't exist
function readEnvFile(file, type) {
    if (!fs_extra_1.default.existsSync(file)) {
        throw new Error(`You specified ${chalk_1.default.cyan(type)} in your env, but the file "${chalk_1.default.yellow(file)}" can't be found.`);
    }
    return fs_extra_1.default.readFileSync(file);
}
const appDirectory = fs_extra_1.default.realpathSync(process.cwd());
// Get the https config
// Return cert files if provided in env, otherwise just true or false
function getHttpsConfig() {
    const { SSL_CRT_FILE, SSL_KEY_FILE, HTTPS } = process.env;
    const isHttps = HTTPS === 'true';
    if (isHttps && SSL_CRT_FILE && SSL_KEY_FILE) {
        const crtFile = path_1.default.resolve(appDirectory, SSL_CRT_FILE);
        const keyFile = path_1.default.resolve(appDirectory, SSL_KEY_FILE);
        const config = {
            cert: readEnvFile(crtFile, 'SSL_CRT_FILE'),
            key: readEnvFile(keyFile, 'SSL_KEY_FILE'),
        };
        validateKeyAndCerts({ ...config, keyFile, crtFile });
        return config;
    }
    return isHttps;
}
exports.getHttpsConfig = getHttpsConfig;
// See https://github.com/webpack-contrib/terser-webpack-plugin#parallel
function getTerserParallel() {
    let terserParallel = true;
    if (process.env.TERSER_PARALLEL === 'false') {
        terserParallel = false;
    }
    else if (process.env.TERSER_PARALLEL &&
        parseInt(process.env.TERSER_PARALLEL, 10) > 0) {
        terserParallel = parseInt(process.env.TERSER_PARALLEL, 10);
    }
    return terserParallel;
}
function getMinimizer(useSimpleCssMinifier = false) {
    const minimizer = [
        new terser_webpack_plugin_1.default({
            parallel: getTerserParallel(),
            terserOptions: {
                parse: {
                    // we want uglify-js to parse ecma 8 code. However, we don't want it
                    // to apply any minification steps that turns valid ecma 5 code
                    // into invalid ecma 5 code. This is why the 'compress' and 'output'
                    // sections only apply transformations that are ecma 5 safe
                    // https://github.com/facebook/create-react-app/pull/4234
                    ecma: 8,
                },
                compress: {
                    ecma: 5,
                    warnings: false,
                },
                mangle: {
                    safari10: true,
                },
                output: {
                    ecma: 5,
                    comments: false,
                    // Turned on because emoji and regex is not minified properly using default
                    // https://github.com/facebook/create-react-app/issues/2488
                    ascii_only: true,
                },
            },
        }),
    ];
    if (useSimpleCssMinifier) {
        minimizer.push(new css_minimizer_webpack_plugin_1.default());
    }
    else {
        minimizer.push(
        // Using the array syntax to add 2 minimizers
        // see https://github.com/webpack-contrib/css-minimizer-webpack-plugin#array
        new css_minimizer_webpack_plugin_1.default({
            minimizerOptions: [
                // CssNano options
                {
                    preset: require.resolve('@docusaurus/cssnano-preset'),
                },
                // CleanCss options
                {
                    inline: false,
                    level: {
                        1: {
                            all: false,
                            removeWhitespace: true,
                        },
                        2: {
                            all: true,
                            restructureRules: true,
                            removeUnusedAtRules: false,
                        },
                    },
                },
            ],
            minify: [
                css_minimizer_webpack_plugin_1.default.cssnanoMinify,
                css_minimizer_webpack_plugin_1.default.cleanCssMinify,
            ],
        }));
    }
    return minimizer;
}
exports.getMinimizer = getMinimizer;
