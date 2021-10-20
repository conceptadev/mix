"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = NavbarItem;
exports.getInfimaActiveClassName = void 0;

var _react = _interopRequireDefault(require("react"));

var _DefaultNavbarItem = _interopRequireDefault(require("@theme/NavbarItem/DefaultNavbarItem"));

var _DropdownNavbarItem = _interopRequireDefault(require("@theme/NavbarItem/DropdownNavbarItem"));

var _LocaleDropdownNavbarItem = _interopRequireDefault(require("@theme/NavbarItem/LocaleDropdownNavbarItem"));

var _SearchNavbarItem = _interopRequireDefault(require("@theme/NavbarItem/SearchNavbarItem"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const NavbarItemComponents = {
  default: () => _DefaultNavbarItem.default,
  localeDropdown: () => _LocaleDropdownNavbarItem.default,
  search: () => _SearchNavbarItem.default,
  dropdown: () => _DropdownNavbarItem.default,
  // Need to lazy load these items as we don't know for sure the docs plugin is loaded
  // See https://github.com/facebook/docusaurus/issues/3360

  /* eslint-disable @typescript-eslint/no-var-requires, global-require */
  docsVersion: () => require('@theme/NavbarItem/DocsVersionNavbarItem').default,
  docsVersionDropdown: () => require('@theme/NavbarItem/DocsVersionDropdownNavbarItem').default,
  doc: () => require('@theme/NavbarItem/DocNavbarItem').default
  /* eslint-enable @typescript-eslint/no-var-requires, global-require */

};

const getNavbarItemComponent = type => {
  const navbarItemComponentFn = NavbarItemComponents[type];

  if (!navbarItemComponentFn) {
    throw new Error(`No NavbarItem component found for type "${type}".`);
  }

  return navbarItemComponentFn();
};

function getComponentType(type, isDropdown) {
  // Backward compatibility: navbar item with no type set
  // but containing dropdown items should use the type "dropdown"
  if (!type || type === 'default') {
    return isDropdown ? 'dropdown' : 'default';
  }

  return type;
}

const getInfimaActiveClassName = mobile => mobile ? 'menu__link--active' : 'navbar__link--active';

exports.getInfimaActiveClassName = getInfimaActiveClassName;

function NavbarItem({
  type,
  ...props
}) {
  const componentType = getComponentType(type, props.items !== undefined);
  const NavbarItemComponent = getNavbarItemComponent(componentType);
  return <NavbarItemComponent {...props} />;
}