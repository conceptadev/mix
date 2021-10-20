"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _useDocs = require("@docusaurus/plugin-content-docs/lib/theme/hooks/useDocs");

Object.keys(_useDocs).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  if (key in exports && exports[key] === _useDocs[key]) return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function () {
      return _useDocs[key];
    }
  });
});