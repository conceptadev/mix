/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { LoadContext } from '@docusaurus/types';
import { DocFile, DocMetadataBase, MetadataOptions, PluginOptions, VersionMetadata } from './types';
declare type LastUpdateOptions = Pick<PluginOptions, 'showLastUpdateAuthor' | 'showLastUpdateTime'>;
export declare function readDocFile(versionMetadata: Pick<VersionMetadata, 'contentPath' | 'contentPathLocalized'>, source: string, options: LastUpdateOptions): Promise<DocFile>;
export declare function readVersionDocs(versionMetadata: VersionMetadata, options: Pick<PluginOptions, 'include' | 'exclude' | 'showLastUpdateAuthor' | 'showLastUpdateTime'>): Promise<DocFile[]>;
export declare function processDocMetadata(args: {
    docFile: DocFile;
    versionMetadata: VersionMetadata;
    context: LoadContext;
    options: MetadataOptions;
}): DocMetadataBase;
export {};
