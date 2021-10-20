"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Link = _interopRequireDefault(require("@docusaurus/Link"));

var _ThemedImage = _interopRequireDefault(require("@theme/ThemedImage"));

var _useBaseUrl = _interopRequireDefault(require("@docusaurus/useBaseUrl"));

var _useDocusaurusContext = _interopRequireDefault(require("@docusaurus/useDocusaurusContext"));

var _themeCommon = require("@docusaurus/theme-common");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const Logo = props => {
  const {
    siteConfig: {
      title
    }
  } = (0, _useDocusaurusContext.default)();
  const {
    navbar: {
      title: navbarTitle,
      logo = {
        src: ''
      }
    }
  } = (0, _themeCommon.useThemeConfig)();
  const {
    imageClassName,
    titleClassName,
    ...propsRest
  } = props;
  const logoLink = (0, _useBaseUrl.default)(logo.href || '/');
  const sources = {
    light: (0, _useBaseUrl.default)(logo.src),
    dark: (0, _useBaseUrl.default)(logo.srcDark || logo.src)
  };
  return <_Link.default to={logoLink} {...propsRest} {...logo.target && {
    target: logo.target
  }}>
      {logo.src && <_ThemedImage.default className={imageClassName} sources={sources} alt={logo.alt || navbarTitle || title} />}
      {navbarTitle != null && <b className={titleClassName}>{navbarTitle}</b>}
    </_Link.default>;
};

var _default = Logo;
exports.default = _default;