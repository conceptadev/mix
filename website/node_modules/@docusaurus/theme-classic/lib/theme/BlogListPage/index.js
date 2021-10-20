"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _useDocusaurusContext = _interopRequireDefault(require("@docusaurus/useDocusaurusContext"));

var _BlogLayout = _interopRequireDefault(require("@theme/BlogLayout"));

var _BlogPostItem = _interopRequireDefault(require("@theme/BlogPostItem"));

var _BlogListPaginator = _interopRequireDefault(require("@theme/BlogListPaginator"));

var _themeCommon = require("@docusaurus/theme-common");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogListPage(props) {
  const {
    metadata,
    items,
    sidebar
  } = props;
  const {
    siteConfig: {
      title: siteTitle
    }
  } = (0, _useDocusaurusContext.default)();
  const {
    blogDescription,
    blogTitle,
    permalink
  } = metadata;
  const isBlogOnlyMode = permalink === '/';
  const title = isBlogOnlyMode ? siteTitle : blogTitle;
  return <_BlogLayout.default title={title} description={blogDescription} wrapperClassName={_themeCommon.ThemeClassNames.wrapper.blogPages} pageClassName={_themeCommon.ThemeClassNames.page.blogListPage} searchMetadatas={{
    // assign unique search tag to exclude this page from search results!
    tag: 'blog_posts_list'
  }} sidebar={sidebar}>
      {items.map(({
      content: BlogPostContent
    }) => <_BlogPostItem.default key={BlogPostContent.metadata.permalink} frontMatter={BlogPostContent.frontMatter} assets={BlogPostContent.assets} metadata={BlogPostContent.metadata} truncated={BlogPostContent.metadata.truncated}>
          <BlogPostContent />
        </_BlogPostItem.default>)}
      <_BlogListPaginator.default metadata={metadata} />
    </_BlogLayout.default>;
}

var _default = BlogListPage;
exports.default = _default;