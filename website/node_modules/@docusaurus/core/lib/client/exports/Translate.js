/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from 'react';
import Interpolate, { interpolate, } from '@docusaurus/Interpolate';
// Can't read it from context, due to exposing imperative API
import codeTranslations from '@generated/codeTranslations';
function getLocalizedMessage({ id, message, }) {
    var _a;
    return (_a = codeTranslations[id !== null && id !== void 0 ? id : message]) !== null && _a !== void 0 ? _a : message;
}
// Imperative translation API is useful for some edge-cases:
// - translating page titles (meta)
// - translating string props (input placeholders, image alt, aria labels...)
export function translate({ message, id }, values) {
    var _a;
    const localizedMessage = (_a = getLocalizedMessage({ message, id })) !== null && _a !== void 0 ? _a : message;
    return interpolate(localizedMessage, values);
}
// Maybe we'll want to improve this component with additional features
// Like toggling a translation mode that adds a little translation button near the text?
export default function Translate({ children, id, values, }) {
    var _a;
    if (typeof children !== 'string') {
        console.warn('Illegal <Translate> children', children);
        throw new Error('The Docusaurus <Translate> component only accept simple string values');
    }
    const localizedMessage = (_a = getLocalizedMessage({ message: children, id })) !== null && _a !== void 0 ? _a : children;
    return React.createElement(Interpolate, { values: values }, localizedMessage);
}
