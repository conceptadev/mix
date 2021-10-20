/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import GithubSlugger from 'github-slugger';
export declare function unwrapMarkdownLinks(line: string): string;
export declare function transformMarkdownHeadingLine(line: string, slugger: GithubSlugger): string;
export declare function transformMarkdownLine(line: string, slugger: GithubSlugger): string;
export declare function transformMarkdownContent(content: string): string;
export default function writeHeadingIds(siteDir: string): Promise<void>;
