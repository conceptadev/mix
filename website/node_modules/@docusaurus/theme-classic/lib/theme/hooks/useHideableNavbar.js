"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = require("react");

var _router = require("@docusaurus/router");

var _useScrollPosition = _interopRequireDefault(require("@theme/hooks/useScrollPosition"));

var _themeCommon = require("@docusaurus/theme-common");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const useHideableNavbar = hideOnScroll => {
  const location = (0, _router.useLocation)();
  const [isNavbarVisible, setIsNavbarVisible] = (0, _react.useState)(hideOnScroll);
  const isFocusedAnchor = (0, _react.useRef)(false);
  const [navbarHeight, setNavbarHeight] = (0, _react.useState)(0);
  const navbarRef = (0, _react.useCallback)(node => {
    if (node !== null) {
      setNavbarHeight(node.getBoundingClientRect().height);
    }
  }, []);
  (0, _useScrollPosition.default)((currentPosition, lastPosition) => {
    const scrollTop = currentPosition.scrollY;
    const lastScrollTop = lastPosition === null || lastPosition === void 0 ? void 0 : lastPosition.scrollY;

    if (!hideOnScroll) {
      return;
    }

    if (scrollTop < navbarHeight) {
      setIsNavbarVisible(true);
      return;
    }

    if (isFocusedAnchor.current) {
      isFocusedAnchor.current = false;
      setIsNavbarVisible(false);
      return;
    }

    if (lastScrollTop && scrollTop === 0) {
      setIsNavbarVisible(true);
    }

    const documentHeight = document.documentElement.scrollHeight - navbarHeight;
    const windowHeight = window.innerHeight;

    if (lastScrollTop && scrollTop >= lastScrollTop) {
      setIsNavbarVisible(false);
    } else if (scrollTop + windowHeight < documentHeight) {
      setIsNavbarVisible(true);
    }
  }, [navbarHeight, isFocusedAnchor]);
  (0, _themeCommon.useLocationChange)(locationChangeEvent => {
    if (!hideOnScroll || locationChangeEvent.location.hash) {
      return;
    }

    setIsNavbarVisible(true);
  });
  (0, _react.useEffect)(() => {
    if (!hideOnScroll) {
      return;
    }

    if (!location.hash) {
      return;
    }

    isFocusedAnchor.current = true;
  }, [location.hash]);
  return {
    navbarRef,
    isNavbarVisible
  };
};

var _default = useHideableNavbar;
exports.default = _default;