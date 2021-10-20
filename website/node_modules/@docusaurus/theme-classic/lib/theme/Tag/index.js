"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _Link = _interopRequireDefault(require("@docusaurus/Link"));

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function Tag(props) {
  const {
    permalink,
    name,
    count
  } = props;
  return <_Link.default href={permalink} className={(0, _clsx.default)(_stylesModule.default.tag, {
    [_stylesModule.default.tagRegular]: !count,
    [_stylesModule.default.tagWithCount]: count
  })}>
      {name}
      {count && <span>{count}</span>}
    </_Link.default>;
}

var _default = Tag;
exports.default = _default;