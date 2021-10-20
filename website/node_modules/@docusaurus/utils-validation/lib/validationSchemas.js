"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FrontMatterTagsSchema = exports.PathnameSchema = exports.URISchema = exports.AdmonitionsSchema = exports.RehypePluginsSchema = exports.RemarkPluginsSchema = exports.PluginIdSchema = void 0;
const tslib_1 = require("tslib");
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const Joi_1 = tslib_1.__importDefault(require("./Joi"));
const utils_1 = require("@docusaurus/utils");
const JoiFrontMatter_1 = require("./JoiFrontMatter");
exports.PluginIdSchema = Joi_1.default.string()
    .regex(/^[a-zA-Z_-]+$/)
    // duplicate core constant, otherwise cyclic dependency is created :(
    .default('default');
const MarkdownPluginsSchema = Joi_1.default.array()
    .items(Joi_1.default.array().ordered(Joi_1.default.function().required(), Joi_1.default.object().required()), Joi_1.default.function(), Joi_1.default.object())
    .default([]);
exports.RemarkPluginsSchema = MarkdownPluginsSchema;
exports.RehypePluginsSchema = MarkdownPluginsSchema;
exports.AdmonitionsSchema = Joi_1.default.object().default({});
// TODO how can we make this emit a custom error message :'(
//  Joi is such a pain, good luck to annoying trying to improve this
exports.URISchema = Joi_1.default.alternatives(Joi_1.default.string().uri({ allowRelative: true }), 
// This custom validation logic is required notably because Joi does not accept paths like /a/b/c ...
Joi_1.default.custom((val, helpers) => {
    try {
        const url = new URL(val);
        if (url) {
            return val;
        }
        else {
            return helpers.error('any.invalid');
        }
    }
    catch {
        return helpers.error('any.invalid');
    }
})).messages({
    'alternatives.match': "{{#label}} does not look like a valid url (value='{{.value}}')",
});
exports.PathnameSchema = Joi_1.default.string()
    .custom((val) => {
    if (!utils_1.isValidPathname(val)) {
        throw new Error();
    }
    else {
        return val;
    }
})
    .message('{{#label}} is not a valid pathname. Pathname should start with slash and not contain any domain or query string.');
exports.FrontMatterTagsSchema = JoiFrontMatter_1.JoiFrontMatter.array().items(JoiFrontMatter_1.JoiFrontMatter.alternatives().try(JoiFrontMatter_1.JoiFrontMatter.string().required(), JoiFrontMatter_1.JoiFrontMatter.object({
    label: JoiFrontMatter_1.JoiFrontMatter.string().required(),
    permalink: JoiFrontMatter_1.JoiFrontMatter.string().required(),
}).required()));
