/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { ComponentProps, ReactElement } from 'react';
export declare type DetailsProps = {
    summary?: ReactElement;
} & ComponentProps<'details'>;
declare const Details: ({ summary, children, ...props }: DetailsProps) => JSX.Element;
export default Details;
