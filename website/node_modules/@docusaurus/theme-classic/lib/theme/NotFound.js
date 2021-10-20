"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _Layout = _interopRequireDefault(require("@theme/Layout"));

var _Translate = _interopRequireWildcard(require("@docusaurus/Translate"));

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
function NotFound() {
  return <_Layout.default title={(0, _Translate.translate)({
    id: 'theme.NotFound.title',
    message: 'Page Not Found'
  })}>
      <main className="container margin-vert--xl">
        <div className="row">
          <div className="col col--6 col--offset-3">
            <h1 className="hero__title">
              <_Translate.default id="theme.NotFound.title" description="The title of the 404 page">
                Page Not Found
              </_Translate.default>
            </h1>
            <p>
              <_Translate.default id="theme.NotFound.p1" description="The first paragraph of the 404 page">
                We could not find what you were looking for.
              </_Translate.default>
            </p>
            <p>
              <_Translate.default id="theme.NotFound.p2" description="The 2nd paragraph of the 404 page">
                Please contact the owner of the site that linked you to the
                original URL and let them know their link is broken.
              </_Translate.default>
            </p>
          </div>
        </div>
      </main>
    </_Layout.default>;
}

var _default = NotFound;
exports.default = _default;