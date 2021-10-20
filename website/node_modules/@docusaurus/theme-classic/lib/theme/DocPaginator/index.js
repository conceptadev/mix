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
function DocPaginator(props) {
  const {
    metadata
  } = props;
  return <nav className="pagination-nav docusaurus-mt-lg" aria-label={(0, _Translate.translate)({
    id: 'theme.docs.paginator.navAriaLabel',
    message: 'Docs pages navigation',
    description: 'The ARIA label for the docs pagination'
  })}>
      <div className="pagination-nav__item">
        {metadata.previous && <_Link.default className="pagination-nav__link" to={metadata.previous.permalink}>
            <div className="pagination-nav__sublabel">
              <_Translate.default id="theme.docs.paginator.previous" description="The label used to navigate to the previous doc">
                Previous
              </_Translate.default>
            </div>
            <div className="pagination-nav__label">
              &laquo; {metadata.previous.title}
            </div>
          </_Link.default>}
      </div>
      <div className="pagination-nav__item pagination-nav__item--next">
        {metadata.next && <_Link.default className="pagination-nav__link" to={metadata.next.permalink}>
            <div className="pagination-nav__sublabel">
              <_Translate.default id="theme.docs.paginator.next" description="The label used to navigate to the next doc">
                Next
              </_Translate.default>
            </div>
            <div className="pagination-nav__label">
              {metadata.next.title} &raquo;
            </div>
          </_Link.default>}
      </div>
    </nav>;
}

var _default = DocPaginator;
exports.default = _default;