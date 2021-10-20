"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _react2 = require("@mdx-js/react");

var _Translate = _interopRequireWildcard(require("@docusaurus/Translate"));

var _Link = _interopRequireDefault(require("@docusaurus/Link"));

var _useBaseUrl = require("@docusaurus/useBaseUrl");

var _themeCommon = require("@docusaurus/theme-common");

var _MDXComponents = _interopRequireDefault(require("@theme/MDXComponents"));

var _EditThisPage = _interopRequireDefault(require("@theme/EditThisPage"));

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

var _TagsListInline = _interopRequireDefault(require("@theme/TagsListInline"));

var _BlogPostAuthors = _interopRequireDefault(require("@theme/BlogPostAuthors"));

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
// Very simple pluralization: probably good enough for now
function useReadingTimePlural() {
  const {
    selectMessage
  } = (0, _themeCommon.usePluralForm)();
  return readingTimeFloat => {
    const readingTime = Math.ceil(readingTimeFloat);
    return selectMessage(readingTime, (0, _Translate.translate)({
      id: 'theme.blog.post.readingTime.plurals',
      description: 'Pluralized label for "{readingTime} min read". Use as much plural forms (separated by "|") as your language support (see https://www.unicode.org/cldr/cldr-aux/charts/34/supplemental/language_plural_rules.html)',
      message: 'One min read|{readingTime} min read'
    }, {
      readingTime
    }));
  };
}

function BlogPostItem(props) {
  var _assets$image;

  const readingTimePlural = useReadingTimePlural();
  const {
    withBaseUrl
  } = (0, _useBaseUrl.useBaseUrlUtils)();
  const {
    children,
    frontMatter,
    assets,
    metadata,
    truncated,
    isBlogPostPage = false
  } = props;
  const {
    date,
    formattedDate,
    permalink,
    tags,
    readingTime,
    title,
    editUrl,
    authors
  } = metadata;
  const image = (_assets$image = assets.image) !== null && _assets$image !== void 0 ? _assets$image : frontMatter.image;

  const renderPostHeader = () => {
    const TitleHeading = isBlogPostPage ? 'h1' : 'h2';
    return <header>
        <TitleHeading className={_stylesModule.default.blogPostTitle} itemProp="headline">
          {isBlogPostPage ? title : <_Link.default itemProp="url" to={permalink}>
              {title}
            </_Link.default>}
        </TitleHeading>
        <div className={(0, _clsx.default)(_stylesModule.default.blogPostData, 'margin-vert--md')}>
          <time dateTime={date} itemProp="datePublished">
            {formattedDate}
          </time>

          {typeof readingTime !== 'undefined' && <>
              {' · '}
              {readingTimePlural(readingTime)}
            </>}
        </div>
        <_BlogPostAuthors.default authors={authors} assets={assets} />
      </header>;
  };

  return <article className={!isBlogPostPage ? 'margin-bottom--xl' : undefined} itemProp="blogPost" itemScope itemType="http://schema.org/BlogPosting">
      {renderPostHeader()}

      {image && <meta itemProp="image" content={withBaseUrl(image, {
      absolute: true
    })} />}

      <div className="markdown" itemProp="articleBody">
        <_react2.MDXProvider components={_MDXComponents.default}>{children}</_react2.MDXProvider>
      </div>

      {(tags.length > 0 || truncated) && <footer className={(0, _clsx.default)('row docusaurus-mt-lg', {
      [_stylesModule.default.blogPostDetailsFull]: isBlogPostPage
    })}>
          {tags.length > 0 && <div className={(0, _clsx.default)('col', {
        'col--9': !isBlogPostPage
      })}>
              <_TagsListInline.default tags={tags} />
            </div>}

          {isBlogPostPage && editUrl && <div className="col margin-top--sm">
              <_EditThisPage.default editUrl={editUrl} />
            </div>}

          {!isBlogPostPage && truncated && <div className="col col--3 text--right">
              <_Link.default to={metadata.permalink} aria-label={`Read more about ${title}`}>
                <b>
                  <_Translate.default id="theme.blog.post.readMore" description="The label used in blog post item excerpts to link to full blog posts">
                    Read More
                  </_Translate.default>
                </b>
              </_Link.default>
            </div>}
        </footer>}
    </article>;
}

var _default = BlogPostItem;
exports.default = _default;