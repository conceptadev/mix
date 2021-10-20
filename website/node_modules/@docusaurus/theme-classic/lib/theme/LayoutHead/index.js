"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = LayoutHead;

var _react = _interopRequireDefault(require("react"));

var _Head = _interopRequireDefault(require("@docusaurus/Head"));

var _useDocusaurusContext = _interopRequireDefault(require("@docusaurus/useDocusaurusContext"));

var _useBaseUrl = _interopRequireDefault(require("@docusaurus/useBaseUrl"));

var _SearchMetadatas = _interopRequireDefault(require("@theme/SearchMetadatas"));

var _Seo = _interopRequireDefault(require("@theme/Seo"));

var _themeCommon = require("@docusaurus/theme-common");

var _router = require("@docusaurus/router");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
// Useful for SEO
// See https://developers.google.com/search/docs/advanced/crawling/localized-versions
// See https://github.com/facebook/docusaurus/issues/3317
function AlternateLangHeaders() {
  const {
    i18n: {
      defaultLocale,
      locales
    }
  } = (0, _useDocusaurusContext.default)();
  const alternatePageUtils = (0, _themeCommon.useAlternatePageUtils)(); // Note: it is fine to use both "x-default" and "en" to target the same url
  // See https://www.searchviu.com/en/multiple-hreflang-tags-one-url/

  return <_Head.default>
      {locales.map(locale => <link key={locale} rel="alternate" href={alternatePageUtils.createUrl({
      locale,
      fullyQualified: true
    })} hrefLang={locale} />)}
      <link rel="alternate" href={alternatePageUtils.createUrl({
      locale: defaultLocale,
      fullyQualified: true
    })} hrefLang="x-default" />
    </_Head.default>;
} // Default canonical url inferred from current page location pathname


function useDefaultCanonicalUrl() {
  const {
    siteConfig: {
      url: siteUrl
    }
  } = (0, _useDocusaurusContext.default)();
  const {
    pathname
  } = (0, _router.useLocation)();
  return siteUrl + (0, _useBaseUrl.default)(pathname);
}

function CanonicalUrlHeaders({
  permalink
}) {
  const {
    siteConfig: {
      url: siteUrl
    }
  } = (0, _useDocusaurusContext.default)();
  const defaultCanonicalUrl = useDefaultCanonicalUrl();
  const canonicalUrl = permalink ? `${siteUrl}${permalink}` : defaultCanonicalUrl;
  return <_Head.default>
      <meta property="og:url" content={canonicalUrl} />
      <link rel="canonical" href={canonicalUrl} />
    </_Head.default>;
}

function LayoutHead(props) {
  const {
    siteConfig: {
      favicon
    },
    i18n: {
      currentLocale,
      localeConfigs
    }
  } = (0, _useDocusaurusContext.default)();
  const {
    metadatas,
    image: defaultImage
  } = (0, _themeCommon.useThemeConfig)();
  const {
    title,
    description,
    image,
    keywords,
    searchMetadatas
  } = props;
  const faviconUrl = (0, _useBaseUrl.default)(favicon);
  const pageTitle = (0, _themeCommon.useTitleFormatter)(title); // See https://github.com/facebook/docusaurus/issues/3317#issuecomment-754661855
  // const htmlLang = currentLocale.split('-')[0];

  const htmlLang = currentLocale; // should we allow the user to override htmlLang with localeConfig?

  const htmlDir = localeConfigs[currentLocale].direction;
  return <>
      <_Head.default>
        <html lang={htmlLang} dir={htmlDir} />
        {favicon && <link rel="shortcut icon" href={faviconUrl} />}
        <title>{pageTitle}</title>
        <meta property="og:title" content={pageTitle} />
        <meta name="twitter:card" content="summary_large_image" />
      </_Head.default>

      {
      /* image can override the default image */
    }
      {defaultImage && <_Seo.default image={defaultImage} />}
      {image && <_Seo.default image={image} />}

      <_Seo.default description={description} keywords={keywords} />

      <CanonicalUrlHeaders />

      <AlternateLangHeaders />

      <_SearchMetadatas.default tag={_themeCommon.DEFAULT_SEARCH_TAG} locale={currentLocale} {...searchMetadatas} />

      <_Head.default // it's important to have an additional <Head> element here,
    // as it allows react-helmet to override values set in previous <Head>
    // ie we can override default metadatas such as "twitter:card"
    // In same Head, the same meta would appear twice instead of overriding
    // See react-helmet doc
    >
        {metadatas.map((metadata, i) => <meta key={`metadata_${i}`} {...metadata} />)}
      </_Head.default>
    </>;
}