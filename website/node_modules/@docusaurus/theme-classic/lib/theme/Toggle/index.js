"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = _default;

var _react = _interopRequireWildcard(require("react"));

var _themeCommon = require("@docusaurus/theme-common");

var _useIsBrowser = _interopRequireDefault(require("@docusaurus/useIsBrowser"));

var _clsx = _interopRequireDefault(require("clsx"));

require("./styles.css");

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
const Dark = ({
  icon,
  style
}) => <span className={(0, _clsx.default)(_stylesModule.default.toggle, _stylesModule.default.dark)} style={style}>
    {icon}
  </span>;

const Light = ({
  icon,
  style
}) => <span className={(0, _clsx.default)(_stylesModule.default.toggle, _stylesModule.default.light)} style={style}>
    {icon}
  </span>; // Based on react-toggle (https://github.com/aaronshaf/react-toggle/).


const Toggle = (0, _react.memo)(({
  className,
  icons,
  checked: defaultChecked,
  disabled,
  onChange
}) => {
  const [checked, setChecked] = (0, _react.useState)(defaultChecked);
  const [focused, setFocused] = (0, _react.useState)(false);
  const inputRef = (0, _react.useRef)(null);
  return <div className={(0, _clsx.default)('react-toggle', className, {
    'react-toggle--checked': checked,
    'react-toggle--focus': focused,
    'react-toggle--disabled': disabled
  })}>
        {
      /* eslint-disable-next-line jsx-a11y/click-events-have-key-events */
    }
        <div className="react-toggle-track" role="button" tabIndex={-1} onClick={() => {
      var _inputRef$current;

      return (_inputRef$current = inputRef.current) === null || _inputRef$current === void 0 ? void 0 : _inputRef$current.click();
    }}>
          <div className="react-toggle-track-check">{icons.checked}</div>
          <div className="react-toggle-track-x">{icons.unchecked}</div>
          <div className="react-toggle-thumb" />
        </div>

        <input ref={inputRef} checked={checked} type="checkbox" className="react-toggle-screenreader-only" aria-label="Switch between dark and light mode" onChange={onChange} onClick={() => setChecked(!checked)} onFocus={() => setFocused(true)} onBlur={() => setFocused(false)} onKeyDown={e => {
      if (e.key === 'Enter') {
        var _inputRef$current2;

        (_inputRef$current2 = inputRef.current) === null || _inputRef$current2 === void 0 ? void 0 : _inputRef$current2.click();
      }
    }} />
      </div>;
});

function _default(props) {
  const {
    colorMode: {
      switchConfig: {
        darkIcon,
        darkIconStyle,
        lightIcon,
        lightIconStyle
      }
    }
  } = (0, _themeCommon.useThemeConfig)();
  const isBrowser = (0, _useIsBrowser.default)();
  return <Toggle disabled={!isBrowser} icons={{
    checked: <Dark icon={darkIcon} style={darkIconStyle} />,
    unchecked: <Light icon={lightIcon} style={lightIconStyle} />
  }} {...props} />;
}