/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { useEffect, useRef } from 'react';
import { useLocation } from '@docusaurus/router';
import { usePrevious } from './usePrevious';
export function useLocationChange(onLocationChange) {
    const location = useLocation();
    const previousLocation = usePrevious(location);
    const isFirst = useRef(true);
    useEffect(() => {
        // Prevent first effect to trigger the listener on mount
        if (isFirst.current) {
            isFirst.current = false;
            return;
        }
        onLocationChange({
            location,
            previousLocation,
        });
    }, [location]);
}
