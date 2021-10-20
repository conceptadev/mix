"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = TOCCollapsible;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _Translate = _interopRequireDefault(require("@docusaurus/Translate"));

var _themeCommon = require("@docusaurus/theme-common");

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

var _TOC = require("@theme/TOC");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function TOCCollapsible({
  toc,
  className
}) {
  const {
    collapsed,
    toggleCollapsed
  } = (0, _themeCommon.useCollapsible)({
    initialState: true
  });
  return <div className={(0, _clsx.default)(_stylesModule.default.tocCollapsible, {
    [_stylesModule.default.tocCollapsibleExpanded]: !collapsed
  }, className)}>
      <button type="button" className={(0, _clsx.default)('clean-btn', _stylesModule.default.tocCollapsibleButton)} onClick={toggleCollapsed}>
        <_Translate.default id="theme.TOCCollapsible.toggleButtonLabel" description="The label used by the button on the collapsible TOC component">
          On this page
        </_Translate.default>
      </button>

      <_themeCommon.Collapsible lazy className={_stylesModule.default.tocCollapsibleContent} collapsed={collapsed}>
        <_TOC.TOCHeadings toc={toc} />
      </_themeCommon.Collapsible>
    </div>;
}