/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { Sidebars, SidebarItem, SidebarItemLink, SidebarItemDoc, Sidebar, SidebarItemCategory, UnprocessedSidebars, UnprocessedSidebar, DocMetadataBase, VersionMetadata, SidebarItemsGeneratorDoc, SidebarItemsGeneratorVersion, NumberPrefixParser, SidebarItemsGeneratorOption, SidebarOptions, PluginOptions } from './types';
export declare const DefaultSidebars: UnprocessedSidebars;
export declare const DisabledSidebars: UnprocessedSidebars;
export declare function resolveSidebarPathOption(siteDir: string, sidebarPathOption: PluginOptions['sidebarPath']): PluginOptions['sidebarPath'];
export declare function loadSidebars(sidebarFilePath: string | false | undefined, options: SidebarOptions): UnprocessedSidebars;
export declare function toSidebarItemsGeneratorDoc(doc: DocMetadataBase): SidebarItemsGeneratorDoc;
export declare function toSidebarItemsGeneratorVersion(version: VersionMetadata): SidebarItemsGeneratorVersion;
export declare function fixSidebarItemInconsistencies(item: SidebarItem): SidebarItem;
export declare function processSidebar({ sidebarItemsGenerator, numberPrefixParser, unprocessedSidebar, docs, version, options, }: {
    sidebarItemsGenerator: SidebarItemsGeneratorOption;
    numberPrefixParser: NumberPrefixParser;
    unprocessedSidebar: UnprocessedSidebar;
    docs: DocMetadataBase[];
    version: VersionMetadata;
    options: SidebarOptions;
}): Promise<Sidebar>;
export declare function processSidebars({ sidebarItemsGenerator, numberPrefixParser, unprocessedSidebars, docs, version, options, }: {
    sidebarItemsGenerator: SidebarItemsGeneratorOption;
    numberPrefixParser: NumberPrefixParser;
    unprocessedSidebars: UnprocessedSidebars;
    docs: DocMetadataBase[];
    version: VersionMetadata;
    options: SidebarOptions;
}): Promise<Sidebars>;
export declare function collectSidebarDocItems(sidebar: Sidebar): SidebarItemDoc[];
export declare function collectSidebarCategories(sidebar: Sidebar): SidebarItemCategory[];
export declare function collectSidebarLinks(sidebar: Sidebar): SidebarItemLink[];
export declare function transformSidebarItems(sidebar: Sidebar, updateFn: (item: SidebarItem) => SidebarItem): Sidebar;
export declare function collectSidebarsDocIds(sidebars: Sidebars): Record<string, string[]>;
export declare function createSidebarsUtils(sidebars: Sidebars): {
    getFirstDocIdOfFirstSidebar: () => string | undefined;
    getSidebarNameByDocId: (docId: string) => string | undefined;
    getDocNavigation: (docId: string) => {
        sidebarName: string | undefined;
        previousId: string | undefined;
        nextId: string | undefined;
    };
    checkSidebarsDocIds: (validDocIds: string[], sidebarFilePath: string) => void;
};
