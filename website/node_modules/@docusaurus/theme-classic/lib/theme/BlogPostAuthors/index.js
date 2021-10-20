"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = BlogPostAuthors;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _BlogPostAuthor = _interopRequireDefault(require("@theme/BlogPostAuthor"));

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
// Component responsible for the authors layout
function BlogPostAuthors({
  authors,
  assets
}) {
  const authorsCount = authors.length;

  if (authorsCount === 0) {
    return <></>;
  }

  return <div className="row margin-top--md margin-bottom--sm">
      {authors.map((author, idx) => {
      var _assets$authorsImageU;

      return <div className={(0, _clsx.default)('col col--6', _stylesModule.default.authorCol)} key={idx}>
          <_BlogPostAuthor.default author={{ ...author,
          // Handle author images using relative paths
          imageURL: (_assets$authorsImageU = assets.authorsImageUrls[idx]) !== null && _assets$authorsImageU !== void 0 ? _assets$authorsImageU : author.imageURL
        }} />
        </div>;
    })}
    </div>;
}