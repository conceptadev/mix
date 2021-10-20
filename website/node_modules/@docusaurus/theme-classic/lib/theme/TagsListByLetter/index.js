"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Tag = _interopRequireDefault(require("@theme/Tag"));

var _themeCommon = require("@docusaurus/theme-common");

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function TagLetterEntryItem({
  letterEntry
}) {
  return <article>
      <h2>{letterEntry.letter}</h2>
      <ul className="padding--none">
        {letterEntry.tags.map(tag => <li key={tag.permalink} className={_stylesModule.default.tag}>
            <_Tag.default {...tag} />
          </li>)}
      </ul>
      <hr />
    </article>;
}

function TagsListByLetter({
  tags
}) {
  const letterList = (0, _themeCommon.listTagsByLetters)(tags);
  return <section className="margin-vert--lg">
      {letterList.map(letterEntry => <TagLetterEntryItem key={letterEntry.letter} letterEntry={letterEntry} />)}
    </section>;
}

var _default = TagsListByLetter;
exports.default = _default;