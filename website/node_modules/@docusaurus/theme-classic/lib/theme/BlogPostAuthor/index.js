"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Link = _interopRequireDefault(require("@docusaurus/Link"));

var _stylesModule = _interopRequireDefault(require("./styles.module.css"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function BlogPostAuthor({
  author
}) {
  const {
    name,
    title,
    url,
    imageURL
  } = author;
  return <div className="avatar margin-bottom--sm">
      {imageURL && <_Link.default className="avatar__photo-link avatar__photo" href={url}>
          <img className={_stylesModule.default.image} src={imageURL} alt={name} />
        </_Link.default>}

      {// Note: only legacy author frontmatter allow empty name (not frontMatter.authors)
    name && <div className="avatar__intro" itemProp="author" itemScope itemType="https://schema.org/Person">
            <div className="avatar__name">
              <_Link.default href={url} itemProp="url">
                <span itemProp="name">{name}</span>
              </_Link.default>
            </div>
            {title && <small className="avatar__subtitle" itemProp="description">
                {title}
              </small>}
          </div>}
    </div>;
}

var _default = BlogPostAuthor;
exports.default = _default;