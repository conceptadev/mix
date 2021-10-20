"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = require("react");

var _themeCommon = require("@docusaurus/theme-common");

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
const TAB_CHOICE_PREFIX = 'docusaurus.tab.';

const useTabGroupChoice = () => {
  const [tabGroupChoices, setChoices] = (0, _react.useState)({});
  const setChoiceSyncWithLocalStorage = (0, _react.useCallback)((groupId, newChoice) => {
    (0, _themeCommon.createStorageSlot)(`${TAB_CHOICE_PREFIX}${groupId}`).set(newChoice);
  }, []);
  (0, _react.useEffect)(() => {
    try {
      const localStorageChoices = {};
      (0, _themeCommon.listStorageKeys)().forEach(storageKey => {
        if (storageKey.startsWith(TAB_CHOICE_PREFIX)) {
          const groupId = storageKey.substring(TAB_CHOICE_PREFIX.length);
          localStorageChoices[groupId] = (0, _themeCommon.createStorageSlot)(storageKey).get();
        }
      });
      setChoices(localStorageChoices);
    } catch (err) {
      console.error(err);
    }
  }, []);
  return {
    tabGroupChoices,
    setTabGroupChoices: (groupId, newChoice) => {
      setChoices(oldChoices => ({ ...oldChoices,
        [groupId]: newChoice
      }));
      setChoiceSyncWithLocalStorage(groupId, newChoice);
    }
  };
};

var _default = useTabGroupChoice;
exports.default = _default;