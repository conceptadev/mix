"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireWildcard(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _router = require("@docusaurus/router");

var _useScrollPosition = _interopRequireDefault(require("@theme/hooks/useScrollPosition"));

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const threshold = 300; // Not all have support for smooth scrolling (particularly Safari mobile iOS)
// TODO proper detection is currently unreliable!
// see https://github.com/wessberg/scroll-behavior-polyfill/issues/16

const SupportsNativeSmoothScrolling = false; // const SupportsNativeSmoothScrolling = ExecutionEnvironment.canUseDOM && 'scrollBehavior' in document.documentElement.style;

function smoothScrollTopNative() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
  return () => {// Nothing to cancel, it's natively cancelled if user tries to scroll down
  };
}

function smoothScrollTopPolyfill() {
  let raf = null;

  function rafRecursion() {
    const currentScroll = document.documentElement.scrollTop;

    if (currentScroll > 0) {
      raf = requestAnimationFrame(rafRecursion);
      window.scrollTo(0, Math.floor(currentScroll * 0.85));
    }
  }

  rafRecursion(); // Break the recursion
  // Prevents the user from "fighting" against that recursion producing a weird UX

  return () => raf && cancelAnimationFrame(raf);
}

function useSmoothScrollToTop() {
  const lastCancelRef = (0, _react.useRef)(null);

  function smoothScrollTop() {
    lastCancelRef.current = SupportsNativeSmoothScrolling ? smoothScrollTopNative() : smoothScrollTopPolyfill();
  }

  return {
    smoothScrollTop,
    cancelScrollToTop: () => {
      var _lastCancelRef$curren;

      return (_lastCancelRef$curren = lastCancelRef.current) === null || _lastCancelRef$curren === void 0 ? void 0 : _lastCancelRef$curren.call(lastCancelRef);
    }
  };
}

function BackToTopButton() {
  const location = (0, _router.useLocation)();
  const {
    smoothScrollTop,
    cancelScrollToTop
  } = useSmoothScrollToTop();
  const [show, setShow] = (0, _react.useState)(false);
  (0, _useScrollPosition.default)(({
    scrollY: scrollTop
  }, lastPosition) => {
    // No lastPosition means component is just being mounted.
    // Not really a scroll event from the user, so we ignore it
    if (!lastPosition) {
      return;
    }

    const lastScrollTop = lastPosition.scrollY;
    const isScrollingUp = scrollTop < lastScrollTop;

    if (!isScrollingUp) {
      cancelScrollToTop();
    }

    if (scrollTop < threshold) {
      setShow(false);
      return;
    }

    if (isScrollingUp) {
      const documentHeight = document.documentElement.scrollHeight;
      const windowHeight = window.innerHeight;

      if (scrollTop + windowHeight < documentHeight) {
        setShow(true);
      }
    } else {
      setShow(false);
    }
  }, [location]);
  return <button className={(0, _clsx.default)('clean-btn', _stylesModule.default.backToTopButton, {
    [_stylesModule.default.backToTopButtonShow]: show
  })} type="button" onClick={() => smoothScrollTop()}>
      <svg viewBox="0 0 24 24" width="28">
        <path d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z" fill="currentColor" />
      </svg>
    </button>;
}

var _default = BackToTopButton;
exports.default = _default;