"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _BlogLayout = _interopRequireDefault(require("@theme/BlogLayout"));

var _TagsListByLetter = _interopRequireDefault(require("@theme/TagsListByLetter"));

var _themeCommon = require("@docusaurus/theme-common");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogTagsListPage(props) {
  const {
    tags,
    sidebar
  } = props;
  const title = (0, _themeCommon.translateTagsPageTitle)();
  return <_BlogLayout.default title={title} wrapperClassName={_themeCommon.ThemeClassNames.wrapper.blogPages} pageClassName={_themeCommon.ThemeClassNames.page.blogTagsListPage} searchMetadatas={{
    // assign unique search tag to exclude this page from search results!
    tag: 'blog_tags_list'
  }} sidebar={sidebar}>
      <h1>{title}</h1>
      <_TagsListByLetter.default tags={Object.values(tags)} />
    </_BlogLayout.default>;
}

var _default = BlogTagsListPage;
exports.default = _default;