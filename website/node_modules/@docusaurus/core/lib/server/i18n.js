"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.localizePath = exports.loadI18n = exports.shouldWarnAboutNodeVersion = exports.getDefaultLocaleConfig = void 0;
const tslib_1 = require("tslib");
const path_1 = tslib_1.__importDefault(require("path"));
const utils_1 = require("@docusaurus/utils");
const rtl_detect_1 = require("rtl-detect");
const constants_1 = require("../constants");
const chalk_1 = tslib_1.__importDefault(require("chalk"));
function getDefaultLocaleLabel(locale) {
    // Intl.DisplayNames is ES2021 - Node14+
    // https://v8.dev/features/intl-displaynames
    // @ts-expect-error: wait for TS support of ES2021 feature
    if (typeof Intl.DisplayNames !== 'undefined') {
        // @ts-expect-error: wait for TS support of ES2021 feature
        return new Intl.DisplayNames([locale], { type: 'language' }).of(locale);
    }
    return locale;
}
function getDefaultLocaleConfig(locale) {
    return {
        label: getDefaultLocaleLabel(locale),
        direction: rtl_detect_1.getLangDir(locale),
    };
}
exports.getDefaultLocaleConfig = getDefaultLocaleConfig;
function shouldWarnAboutNodeVersion(version, locales) {
    const isOnlyEnglish = locales.length === 1 && locales.includes('en');
    const isOlderNodeVersion = version < 14;
    return isOlderNodeVersion && !isOnlyEnglish;
}
exports.shouldWarnAboutNodeVersion = shouldWarnAboutNodeVersion;
async function loadI18n(config, options = {}) {
    var _a;
    const { i18n: i18nConfig } = config;
    const currentLocale = (_a = options.locale) !== null && _a !== void 0 ? _a : i18nConfig.defaultLocale;
    if (!i18nConfig.locales.includes(currentLocale)) {
        console.warn(chalk_1.default.yellow(`The locale "${currentLocale}" was not found in your site configuration: Available locales are: ${i18nConfig.locales.join(',')}.
Note: Docusaurus only support running one locale at a time.`));
    }
    const locales = i18nConfig.locales.includes(currentLocale)
        ? i18nConfig.locales
        : i18nConfig.locales.concat(currentLocale);
    if (shouldWarnAboutNodeVersion(constants_1.NODE_MAJOR_VERSION, locales)) {
        console.warn(chalk_1.default.yellow(`To use Docusaurus i18n, it is strongly advised to use Node.js 14 or later (instead of ${constants_1.NODE_MAJOR_VERSION}).`));
    }
    function getLocaleConfig(locale) {
        return {
            ...getDefaultLocaleConfig(locale),
            ...i18nConfig.localeConfigs[locale],
        };
    }
    const localeConfigs = locales.reduce((acc, locale) => {
        return { ...acc, [locale]: getLocaleConfig(locale) };
    }, {});
    return {
        defaultLocale: i18nConfig.defaultLocale,
        locales,
        currentLocale,
        localeConfigs,
    };
}
exports.loadI18n = loadI18n;
function localizePath({ pathType, path: originalPath, i18n, options = {}, }) {
    const shouldLocalizePath = typeof options.localizePath === 'undefined'
        ? // By default, we don't localize the path of defaultLocale
            i18n.currentLocale !== i18n.defaultLocale
        : options.localizePath;
    if (shouldLocalizePath) {
        // FS paths need special care, for Windows support
        if (pathType === 'fs') {
            return path_1.default.join(originalPath, path_1.default.sep, i18n.currentLocale, path_1.default.sep);
        }
        // Url paths
        else if (pathType === 'url') {
            return utils_1.normalizeUrl([originalPath, '/', i18n.currentLocale, '/']);
        }
        // should never happen
        else {
            throw new Error(`Unhandled path type "${pathType}".`);
        }
    }
    else {
        return originalPath;
    }
}
exports.localizePath = localizePath;
