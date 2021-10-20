"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = exports.MainHeading = void 0;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _Translate = require("@docusaurus/Translate");

var _themeCommon = require("@docusaurus/theme-common");

require("./styles.css");

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable jsx-a11y/anchor-has-content, jsx-a11y/anchor-is-valid */
const MainHeading = function MainHeading({ ...props
}) {
  return <header>
      <h1 {...props} id={undefined} // h1 headings do not need an id because they don't appear in the TOC
    >
        {props.children}
      </h1>
    </header>;
};

exports.MainHeading = MainHeading;

const createAnchorHeading = Tag => function TargetComponent({
  id,
  ...props
}) {
  const {
    navbar: {
      hideOnScroll
    }
  } = (0, _themeCommon.useThemeConfig)();

  if (!id) {
    return <Tag {...props} />;
  }

  return <Tag {...props}>
        <a aria-hidden="true" tabIndex={-1} className={(0, _clsx.default)('anchor', `anchor__${Tag}`, {
      [_stylesModule.default.anchorWithHideOnScrollNavbar]: hideOnScroll,
      [_stylesModule.default.anchorWithStickyNavbar]: !hideOnScroll
    })} id={id} />
        {props.children}
        <a className="hash-link" href={`#${id}`} title={(0, _Translate.translate)({
      id: 'theme.common.headingLinkTitle',
      message: 'Direct link to heading',
      description: 'Title for link to heading'
    })}>
          #
        </a>
      </Tag>;
};

const Heading = headingType => {
  return headingType === 'h1' ? MainHeading : createAnchorHeading(headingType);
};

var _default = Heading;
exports.default = _default;