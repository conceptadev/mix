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
const getScrollPosition = () => {
  return _ExecutionEnvironment.default.canUseDOM ? {
    scrollX: window.pageXOffset,
    scrollY: window.pageYOffset
  } : null;
};

const useScrollPosition = (effect, deps = []) => {
  const lastPositionRef = (0, _react.useRef)(getScrollPosition());

  const handleScroll = () => {
    const currentPosition = getScrollPosition();

    if (effect) {
      effect(currentPosition, lastPositionRef.current);
    }

    lastPositionRef.current = currentPosition;
  };

  (0, _react.useEffect)(() => {
    const opts = {
      passive: true
    };
    handleScroll();
    window.addEventListener('scroll', handleScroll, opts);
    return () => window.removeEventListener('scroll', handleScroll, opts);
  }, deps);
};

var _default = useScrollPosition;
exports.default = _default;