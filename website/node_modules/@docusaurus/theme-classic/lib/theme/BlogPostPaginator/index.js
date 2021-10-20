"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Translate = _interopRequireWildcard(require("@docusaurus/Translate"));

var _Link = _interopRequireDefault(require("@docusaurus/Link"));

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogPostPaginator(props) {
  const {
    nextItem,
    prevItem
  } = props;
  return <nav className="pagination-nav docusaurus-mt-lg" aria-label={(0, _Translate.translate)({
    id: 'theme.blog.post.paginator.navAriaLabel',
    message: 'Blog post page navigation',
    description: 'The ARIA label for the blog posts pagination'
  })}>
      <div className="pagination-nav__item">
        {prevItem && <_Link.default className="pagination-nav__link" to={prevItem.permalink}>
            <div className="pagination-nav__sublabel">
              <_Translate.default id="theme.blog.post.paginator.newerPost" description="The blog post button label to navigate to the newer/previous post">
                Newer Post
              </_Translate.default>
            </div>
            <div className="pagination-nav__label">
              &laquo; {prevItem.title}
            </div>
          </_Link.default>}
      </div>
      <div className="pagination-nav__item pagination-nav__item--next">
        {nextItem && <_Link.default className="pagination-nav__link" to={nextItem.permalink}>
            <div className="pagination-nav__sublabel">
              <_Translate.default id="theme.blog.post.paginator.olderPost" description="The blog post button label to navigate to the older/next post">
                Older Post
              </_Translate.default>
            </div>
            <div className="pagination-nav__label">
              {nextItem.title} &raquo;
            </div>
          </_Link.default>}
      </div>
    </nav>;
}

var _default = BlogPostPaginator;
exports.default = _default;