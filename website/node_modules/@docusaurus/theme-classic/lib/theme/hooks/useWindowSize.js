"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = require("react");

var _ExecutionEnvironment = _interopRequireDefault(require("@docusaurus/ExecutionEnvironment"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const windowSizes = {
  desktop: 'desktop',
  mobile: 'mobile',
  // This "ssr" value is very important to handle hydration FOUC / layout shifts
  // You have to handle server-rendering explicitly on the call-site
  // On the server, you may need to render BOTH the mobile/desktop elements (and hide one of them with mediaquery)
  // We don't return "undefined" on purpose, to make it more explicit
  ssr: 'ssr'
};
const DesktopThresholdWidth = 996;

function getWindowSize() {
  if (!_ExecutionEnvironment.default.canUseDOM) {
    return windowSizes.ssr;
  }

  return window.innerWidth > DesktopThresholdWidth ? windowSizes.desktop : windowSizes.mobile;
} // Simulate the SSR window size in dev, so that potential hydration FOUC/layout shift problems can be seen in dev too!


const DevSimulateSSR = process.env.NODE_ENV === 'development' && true; // This hook returns an enum value on purpose!
// We don't want it to return the actual width value, for resize perf reasons
// We only want to re-render once a breakpoint is crossed

function useWindowSize() {
  const [windowSize, setWindowSize] = (0, _react.useState)(() => {
    if (DevSimulateSSR) {
      return 'ssr';
    }

    return getWindowSize();
  });
  (0, _react.useEffect)(() => {
    function updateWindowSize() {
      setWindowSize(getWindowSize());
    } // @ts-expect-error: annoying TS setTimeout typing...


    const timeout = DevSimulateSSR ? setTimeout(updateWindowSize, 1000) : undefined;
    window.addEventListener('resize', updateWindowSize);
    return () => {
      window.removeEventListener('resize', updateWindowSize);
      clearTimeout(timeout);
    };
  }, []);
  return windowSize;
}

var _default = useWindowSize;
exports.default = _default;