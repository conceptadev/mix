/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
declare const StorageTypes: readonly ["localStorage", "sessionStorage", "none"];
export declare type StorageType = typeof StorageTypes[number];
export interface StorageSlot {
    get: () => string | null;
    set: (value: string) => void;
    del: () => void;
}
/**
 * Creates an object for accessing a particular key in localStorage.
 */
export declare const createStorageSlot: (key: string, options?: {
    persistence?: "localStorage" | "none" | "sessionStorage" | undefined;
} | undefined) => StorageSlot;
/**
 * Returns a list of all the keys currently stored in browser storage
 * or an empty list if browser storage can't be accessed.
 */
export declare function listStorageKeys(storageType?: StorageType): string[];
export {};
