"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Seo = _interopRequireDefault(require("@theme/Seo"));

var _BlogLayout = _interopRequireDefault(require("@theme/BlogLayout"));

var _BlogPostItem = _interopRequireDefault(require("@theme/BlogPostItem"));

var _BlogPostPaginator = _interopRequireDefault(require("@theme/BlogPostPaginator"));

var _themeCommon = require("@docusaurus/theme-common");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogPostPage(props) {
  var _assets$image;

  const {
    content: BlogPostContents,
    sidebar
  } = props;
  const {
    frontMatter,
    assets,
    metadata
  } = BlogPostContents;
  const {
    title,
    description,
    nextItem,
    prevItem,
    date,
    tags,
    authors
  } = metadata;
  const {
    hide_table_of_contents: hideTableOfContents,
    keywords
  } = frontMatter;
  const image = (_assets$image = assets.image) !== null && _assets$image !== void 0 ? _assets$image : frontMatter.image;
  return <_BlogLayout.default wrapperClassName={_themeCommon.ThemeClassNames.wrapper.blogPages} pageClassName={_themeCommon.ThemeClassNames.page.blogPostPage} sidebar={sidebar} toc={!hideTableOfContents && BlogPostContents.toc ? BlogPostContents.toc : undefined}>
      <_Seo.default // TODO refactor needed: it's a bit annoying but Seo MUST be inside BlogLayout
    // otherwise  default image (set by BlogLayout) would shadow the custom blog post image
    title={title} description={description} keywords={keywords} image={image}>
        <meta property="og:type" content="article" />
        <meta property="article:published_time" content={date} />

        {
        /* TODO double check those article metas array syntaxes, see https://ogp.me/#array */
      }
        {authors.some(author => author.url) && <meta property="article:author" content={authors.map(author => author.url).filter(Boolean).join(',')} />}
        {tags.length > 0 && <meta property="article:tag" content={tags.map(tag => tag.label).join(',')} />}
      </_Seo.default>

      <_BlogPostItem.default frontMatter={frontMatter} assets={assets} metadata={metadata} isBlogPostPage>
        <BlogPostContents />
      </_BlogPostItem.default>

      {(nextItem || prevItem) && <_BlogPostPaginator.default nextItem={nextItem} prevItem={prevItem} />}
    </_BlogLayout.default>;
}

var _default = BlogPostPage;
exports.default = _default;