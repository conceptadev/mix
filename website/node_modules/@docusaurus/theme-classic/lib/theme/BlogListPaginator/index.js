"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Link = _interopRequireDefault(require("@docusaurus/Link"));

var _Translate = _interopRequireWildcard(require("@docusaurus/Translate"));

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogListPaginator(props) {
  const {
    metadata
  } = props;
  const {
    previousPage,
    nextPage
  } = metadata;
  return <nav className="pagination-nav" aria-label={(0, _Translate.translate)({
    id: 'theme.blog.paginator.navAriaLabel',
    message: 'Blog list page navigation',
    description: 'The ARIA label for the blog pagination'
  })}>
      <div className="pagination-nav__item">
        {previousPage && <_Link.default className="pagination-nav__link" to={previousPage}>
            <div className="pagination-nav__label">
              &laquo;{' '}
              <_Translate.default id="theme.blog.paginator.newerEntries" description="The label used to navigate to the newer blog posts page (previous page)">
                Newer Entries
              </_Translate.default>
            </div>
          </_Link.default>}
      </div>
      <div className="pagination-nav__item pagination-nav__item--next">
        {nextPage && <_Link.default className="pagination-nav__link" to={nextPage}>
            <div className="pagination-nav__label">
              <_Translate.default id="theme.blog.paginator.olderEntries" description="The label used to navigate to the older blog posts page (next page)">
                Older Entries
              </_Translate.default>{' '}
              &raquo;
            </div>
          </_Link.default>}
      </div>
    </nav>;
}

var _default = BlogListPaginator;
exports.default = _default;