"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = DocNavbarItem;

var _react = _interopRequireDefault(require("react"));

var _DefaultNavbarItem = _interopRequireDefault(require("@theme/NavbarItem/DefaultNavbarItem"));

var _useDocs = require("@theme/hooks/useDocs");

var _clsx = _interopRequireDefault(require("clsx"));

var _index = require("./index");

var _themeCommon = require("@docusaurus/theme-common");

var _utilsCommon = require("@docusaurus/utils-common");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function getDocInVersions(versions, docId) {
  const allDocs = versions.flatMap(version => version.docs);
  const doc = allDocs.find(versionDoc => versionDoc.id === docId);

  if (!doc) {
    const docIds = allDocs.map(versionDoc => versionDoc.id).join('\n- ');
    throw new Error(`DocNavbarItem: couldn't find any doc with id "${docId}" in version${versions.length ? 's' : ''} ${versions.map(version => version.name).join(', ')}".
Available doc ids are:\n- ${docIds}`);
  }

  return doc;
}

function DocNavbarItem({
  docId,
  label: staticLabel,
  docsPluginId,
  ...props
}) {
  const {
    activeVersion,
    activeDoc
  } = (0, _useDocs.useActiveDocContext)(docsPluginId);
  const {
    preferredVersion
  } = (0, _themeCommon.useDocsPreferredVersion)(docsPluginId);
  const latestVersion = (0, _useDocs.useLatestVersion)(docsPluginId); // Versions used to look for the doc to link to, ordered + no duplicate

  const versions = (0, _utilsCommon.uniq)([activeVersion, preferredVersion, latestVersion].filter(Boolean));
  const doc = getDocInVersions(versions, docId);
  const activeDocInfimaClassName = (0, _index.getInfimaActiveClassName)(props.mobile);
  return <_DefaultNavbarItem.default exact {...props} className={(0, _clsx.default)(props.className, {
    [activeDocInfimaClassName]: (activeDoc === null || activeDoc === void 0 ? void 0 : activeDoc.sidebar) && activeDoc.sidebar === doc.sidebar
  })} activeClassName={activeDocInfimaClassName} label={staticLabel !== null && staticLabel !== void 0 ? staticLabel : doc.id} to={doc.path} />;
}