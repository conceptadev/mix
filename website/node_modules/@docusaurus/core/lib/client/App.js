/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from 'react';
import routes from '@generated/routes';
import renderRoutes from './exports/renderRoutes';
import { BrowserContextProvider } from './exports/browserContext';
import { DocusaurusContextProvider } from './exports/docusaurusContext';
import PendingNavigation from './PendingNavigation';
import BaseUrlIssueBanner from './baseUrlIssueBanner/BaseUrlIssueBanner';
import Root from '@theme/Root';
import './client-lifecycles-dispatcher';
function App() {
    return (React.createElement(DocusaurusContextProvider, null,
        React.createElement(BrowserContextProvider, null,
            React.createElement(Root, null,
                React.createElement(BaseUrlIssueBanner, null),
                React.createElement(PendingNavigation, { routes: routes }, renderRoutes(routes))))));
}
export default App;
