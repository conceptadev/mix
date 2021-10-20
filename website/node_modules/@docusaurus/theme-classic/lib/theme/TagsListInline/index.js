"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = TagsListInline;

var _react = _interopRequireDefault(require("react"));

var _clsx = _interopRequireDefault(require("clsx"));

var _Translate = _interopRequireDefault(require("@docusaurus/Translate"));

var _Tag = _interopRequireDefault(require("@theme/Tag"));

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function TagsListInline({
  tags
}) {
  return <>
      <b>
        <_Translate.default id="theme.tags.tagsListLabel" description="The label alongside a tag list">
          Tags:
        </_Translate.default>
      </b>
      <ul className={(0, _clsx.default)(_stylesModule.default.tags, 'padding--none', 'margin-left--sm')}>
        {tags.map(({
        label,
        permalink: tagPermalink
      }) => <li key={tagPermalink} className={_stylesModule.default.tag}>
            <_Tag.default name={label} permalink={tagPermalink} />
          </li>)}
      </ul>
    </>;
}