"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = Details;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _themeCommon = require("@docusaurus/theme-common");

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
// Should we have a custom details/summary comp in Infima instead of reusing alert classes?
const InfimaClasses = 'alert alert--info';

function Details({ ...props
}) {
  return <_themeCommon.Details {...props} className={(0, _clsx.default)(InfimaClasses, _stylesModule.default.details, props.className)} />;
}