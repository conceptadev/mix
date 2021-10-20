"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.readDefaultCodeTranslationMessages = exports.codeTranslationLocalesToTry = void 0;
const tslib_1 = require("tslib");
const path_1 = tslib_1.__importDefault(require("path"));
const fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
// Return an ordered list of locales we should try
function codeTranslationLocalesToTry(locale) {
    // @ts-expect-error: TODO until available in TS, see https://github.com/microsoft/TypeScript/issues/37326
    const intlLocale = Intl.Locale ? new Intl.Locale(locale) : undefined;
    if (!intlLocale) {
        return [locale];
    }
    // if locale is just a simple language like "pt", we want to fallback to pt-BR (not pt-PT!)
    // see https://github.com/facebook/docusaurus/pull/4536#issuecomment-810088783
    if (intlLocale.language === locale) {
        const maximizedLocale = intlLocale.maximize(); // pt-Latn-BR`
        // ["pt","pt-BR"]
        return [locale, `${maximizedLocale.language}-${maximizedLocale.region}`];
    }
    // if locale is like "pt-BR", we want to fallback to "pt"
    else {
        return [locale, intlLocale.language];
    }
}
exports.codeTranslationLocalesToTry = codeTranslationLocalesToTry;
// Useful to implement getDefaultCodeTranslationMessages() in themes
async function readDefaultCodeTranslationMessages({ dirPath, locale, }) {
    const localesToTry = codeTranslationLocalesToTry(locale);
    // Return the content of the first file that match
    // fr_FR.json => fr.json => nothing
    // eslint-disable-next-line no-restricted-syntax
    for (const fileName of localesToTry) {
        const filePath = path_1.default.resolve(dirPath, `${fileName}.json`);
        // eslint-disable-next-line no-await-in-loop
        if (await fs_extra_1.default.pathExists(filePath)) {
            // eslint-disable-next-line no-await-in-loop
            const fileContent = await fs_extra_1.default.readFile(filePath, 'utf8');
            return JSON.parse(fileContent);
        }
    }
    return {};
}
exports.readDefaultCodeTranslationMessages = readDefaultCodeTranslationMessages;
