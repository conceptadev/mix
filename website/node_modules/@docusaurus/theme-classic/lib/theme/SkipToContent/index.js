"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireWildcard(require("react"));

var _router = require("@docusaurus/router");

var _Translate = _interopRequireDefault(require("@docusaurus/Translate"));

var _themeCommon = require("@docusaurus/theme-common");

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
function programmaticFocus(el) {
  el.setAttribute('tabindex', '-1');
  el.focus();
  el.removeAttribute('tabindex');
}

function SkipToContent() {
  const containerRef = (0, _react.useRef)(null);
  const {
    action
  } = (0, _router.useHistory)();

  const handleSkip = e => {
    e.preventDefault();
    const targetElement = document.querySelector('main:first-of-type') || document.querySelector('.main-wrapper');

    if (targetElement) {
      programmaticFocus(targetElement);
    }
  };

  (0, _themeCommon.useLocationChange)(({
    location
  }) => {
    if (containerRef.current && !location.hash && action === 'PUSH') {
      programmaticFocus(containerRef.current);
    }
  });
  return <div ref={containerRef}>
      {
      /* eslint-disable-next-line jsx-a11y/anchor-is-valid */
    }
      <a href="#" className={_stylesModule.default.skipToContent} onClick={handleSkip}>
        <_Translate.default id="theme.common.skipToMainContent" description="The skip to content label used for accessibility, allowing to rapidly navigate to main content with keyboard tab/enter navigation">
          Skip to main content
        </_Translate.default>
      </a>
    </div>;
}

var _default = SkipToContent;
exports.default = _default;