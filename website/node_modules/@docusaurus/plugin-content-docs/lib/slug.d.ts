/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { NumberPrefixParser } from './types';
export default function getSlug({ baseID, frontmatterSlug, dirName, stripDirNumberPrefixes, numberPrefixParser, }: {
    baseID: string;
    frontmatterSlug?: string;
    dirName: string;
    stripDirNumberPrefixes?: boolean;
    numberPrefixParser?: NumberPrefixParser;
}): string;
