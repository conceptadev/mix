/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
/// <reference types="node" />
interface Loader extends Function {
    (this: any, source: string): Promise<string | Buffer | void | undefined>;
}
declare const docusaurusMdxLoader: Loader;
export default docusaurusMdxLoader;
