/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from 'react';
import useTabGroupChoice from '@theme/hooks/useTabGroupChoice';
import UserPreferencesContext from '@theme/UserPreferencesContext';

function UserPreferencesProvider(props) {
  const {tabGroupChoices, setTabGroupChoices} = useTabGroupChoice();
  return (
    <UserPreferencesContext.Provider
      value={{
        tabGroupChoices,
        setTabGroupChoices,
      }}>
      {props.children}
    </UserPreferencesContext.Provider>
  );
}

export default UserPreferencesProvider;
