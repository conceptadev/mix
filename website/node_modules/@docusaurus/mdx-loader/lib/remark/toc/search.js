"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const mdast_util_to_string_1 = tslib_1.__importDefault(require("mdast-util-to-string"));
const unist_util_visit_1 = tslib_1.__importDefault(require("unist-util-visit"));
const utils_1 = require("../utils");
// Visit all headings. We `slug` all headings (to account for
// duplicates), but only take h2 and h3 headings.
function search(node) {
    const headings = [];
    let current = -1;
    let currentDepth = 0;
    const visitor = (child, _index, parent) => {
        const value = mdast_util_to_string_1.default(child);
        if (parent !== node || !value || child.depth > 3 || child.depth < 2) {
            return;
        }
        const entry = {
            value: utils_1.toValue(child),
            id: child.data.id,
            children: [],
        };
        if (!headings.length || currentDepth >= child.depth) {
            headings.push(entry);
            current += 1;
            currentDepth = child.depth;
        }
        else {
            headings[current].children.push(entry);
        }
    };
    unist_util_visit_1.default(node, 'heading', visitor);
    return headings;
}
exports.default = search;
