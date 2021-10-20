"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const utils_1 = require("@docusaurus/utils");
const numberPrefix_1 = require("./numberPrefix");
function getSlug({ baseID, frontmatterSlug, dirName, stripDirNumberPrefixes = true, numberPrefixParser = numberPrefix_1.DefaultNumberPrefixParser, }) {
    const baseSlug = frontmatterSlug || baseID;
    let slug;
    if (baseSlug.startsWith('/')) {
        slug = baseSlug;
    }
    else {
        const dirNameStripped = stripDirNumberPrefixes
            ? numberPrefix_1.stripPathNumberPrefixes(dirName, numberPrefixParser)
            : dirName;
        const resolveDirname = dirName === '.'
            ? '/'
            : utils_1.addLeadingSlash(utils_1.addTrailingSlash(dirNameStripped));
        slug = utils_1.resolvePathname(baseSlug, resolveDirname);
    }
    if (!utils_1.isValidPathname(slug)) {
        throw new Error(`We couldn't compute a valid slug for document with id "${baseID}" in "${dirName}" directory.
The slug we computed looks invalid: ${slug}.
Maybe your slug frontmatter is incorrect or you use weird chars in the file path?
By using the slug frontmatter, you should be able to fix this error, by using the slug of your choice:

Example =>
---
slug: /my/customDocPath
---
`);
    }
    return slug;
}
exports.default = getSlug;
