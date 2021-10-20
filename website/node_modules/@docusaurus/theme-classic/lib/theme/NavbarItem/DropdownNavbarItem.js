"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireWildcard(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _themeCommon = require("@docusaurus/theme-common");

var _DefaultNavbarItem = require("@theme/NavbarItem/DefaultNavbarItem");

var _NavbarItem = _interopRequireDefault(require("@theme/NavbarItem"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const dropdownLinkActiveClass = 'dropdown__link--active';

function isItemActive(item, localPathname) {
  if ((0, _themeCommon.isSamePath)(item.to, localPathname)) {
    return true;
  }

  if (item.activeBaseRegex && new RegExp(item.activeBaseRegex).test(localPathname)) {
    return true;
  }

  if (item.activeBasePath && localPathname.startsWith(item.activeBasePath)) {
    return true;
  }

  return false;
}

function containsActiveItems(items, localPathname) {
  return items.some(item => isItemActive(item, localPathname));
}

function DropdownNavbarItemDesktop({
  items,
  position,
  className,
  ...props
}) {
  var _props$children;

  const dropdownRef = (0, _react.useRef)(null);
  const dropdownMenuRef = (0, _react.useRef)(null);
  const [showDropdown, setShowDropdown] = (0, _react.useState)(false);
  (0, _react.useEffect)(() => {
    const handleClickOutside = event => {
      if (!dropdownRef.current || dropdownRef.current.contains(event.target)) {
        return;
      }

      setShowDropdown(false);
    };

    document.addEventListener('mousedown', handleClickOutside);
    document.addEventListener('touchstart', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
      document.removeEventListener('touchstart', handleClickOutside);
    };
  }, [dropdownRef]);
  return <div ref={dropdownRef} className={(0, _clsx.default)('navbar__item', 'dropdown', 'dropdown--hoverable', {
    'dropdown--right': position === 'right',
    'dropdown--show': showDropdown
  })}>
      <_DefaultNavbarItem.NavLink className={(0, _clsx.default)('navbar__link', className)} {...props} onClick={props.to ? undefined : e => e.preventDefault()} onKeyDown={e => {
      if (e.key === 'Enter') {
        e.preventDefault();
        setShowDropdown(!showDropdown);
      }
    }}>
        {(_props$children = props.children) !== null && _props$children !== void 0 ? _props$children : props.label}
      </_DefaultNavbarItem.NavLink>
      <ul ref={dropdownMenuRef} className="dropdown__menu">
        {items.map((childItemProps, i) => <_NavbarItem.default isDropdownItem onKeyDown={e => {
        if (i === items.length - 1 && e.key === 'Tab') {
          e.preventDefault();
          setShowDropdown(false);
          const nextNavbarItem = dropdownRef.current.nextElementSibling;

          if (nextNavbarItem) {
            nextNavbarItem.focus();
          }
        }
      }} activeClassName={dropdownLinkActiveClass} {...childItemProps} key={i} />)}
      </ul>
    </div>;
}

function DropdownNavbarItemMobile({
  items,
  className,
  position: _position,
  // Need to destructure position from props so that it doesn't get passed on.
  ...props
}) {
  var _props$children2;

  const localPathname = (0, _themeCommon.useLocalPathname)();
  const containsActive = containsActiveItems(items, localPathname);
  const {
    collapsed,
    toggleCollapsed,
    setCollapsed
  } = (0, _themeCommon.useCollapsible)({
    initialState: () => !containsActive
  }); // Expand/collapse if any item active after a navigation

  (0, _react.useEffect)(() => {
    if (containsActive) {
      setCollapsed(!containsActive);
    }
  }, [localPathname, containsActive]);
  return <li className={(0, _clsx.default)('menu__list-item', {
    'menu__list-item--collapsed': collapsed
  })}>
      <_DefaultNavbarItem.NavLink role="button" className={(0, _clsx.default)('menu__link menu__link--sublist', className)} {...props} onClick={e => {
      e.preventDefault();
      toggleCollapsed();
    }}>
        {(_props$children2 = props.children) !== null && _props$children2 !== void 0 ? _props$children2 : props.label}
      </_DefaultNavbarItem.NavLink>
      <_themeCommon.Collapsible lazy as="ul" className="menu__list" collapsed={collapsed}>
        {items.map((childItemProps, i) => <_NavbarItem.default mobile isDropdownItem onClick={props.onClick} activeClassName="menu__link--active" {...childItemProps} key={i} />)}
      </_themeCommon.Collapsible>
    </li>;
}

function DropdownNavbarItem({
  mobile = false,
  ...props
}) {
  const Comp = mobile ? DropdownNavbarItemMobile : DropdownNavbarItemDesktop;
  return <Comp {...props} />;
}

var _default = DropdownNavbarItem;
exports.default = _default;