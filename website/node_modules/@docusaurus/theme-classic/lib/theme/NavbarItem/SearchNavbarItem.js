"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = SearchNavbarItem;

var _react = _interopRequireDefault(require("react"));

var _SearchBar = _interopRequireDefault(require("@theme/SearchBar"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function SearchNavbarItem({
  mobile
}) {
  if (mobile) {
    return null;
  }

  return <_SearchBar.default />;
}