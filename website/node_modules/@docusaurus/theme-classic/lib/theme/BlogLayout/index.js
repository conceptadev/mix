"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _Layout = _interopRequireDefault(require("@theme/Layout"));

var _BlogSidebar = _interopRequireDefault(require("@theme/BlogSidebar"));

var _TOC = _interopRequireDefault(require("@theme/TOC"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogLayout(props) {
  const {
    sidebar,
    toc,
    children,
    ...layoutProps
  } = props;
  const hasSidebar = sidebar && sidebar.items.length > 0;
  return <_Layout.default {...layoutProps}>
      <div className="container margin-vert--lg">
        <div className="row">
          {hasSidebar && <aside className="col col--3">
              <_BlogSidebar.default sidebar={sidebar} />
            </aside>}
          <main className={(0, _clsx.default)('col', {
          'col--7': hasSidebar,
          'col--9 col--offset-1': !hasSidebar
        })} itemScope itemType="http://schema.org/Blog">
            {children}
          </main>
          {toc && <div className="col col--2">
              <_TOC.default toc={toc} />
            </div>}
        </div>
      </div>
    </_Layout.default>;
}

var _default = BlogLayout;
exports.default = _default;