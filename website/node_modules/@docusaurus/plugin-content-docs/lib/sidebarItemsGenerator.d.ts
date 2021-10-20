/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { SidebarItemsGenerator } from './types';
export declare const CategoryMetadataFilenameBase = "_category_";
export declare const CategoryMetadataFilenamePattern = "_category_.{json,yml,yaml}";
export declare type CategoryMetadatasFile = {
    label?: string;
    position?: number;
    collapsed?: boolean;
    collapsible?: boolean;
};
export declare const DefaultSidebarItemsGenerator: SidebarItemsGenerator;
