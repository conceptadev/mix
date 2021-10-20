/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import {useEffect, useRef} from 'react';
import ExecutionEnvironment from '@docusaurus/ExecutionEnvironment';

const getScrollPosition = () => {
  return ExecutionEnvironment.canUseDOM
    ? {
        scrollX: window.pageXOffset,
        scrollY: window.pageYOffset,
      }
    : null;
};

const useScrollPosition = (effect, deps = []) => {
  const lastPositionRef = useRef(getScrollPosition());

  const handleScroll = () => {
    const currentPosition = getScrollPosition();

    if (effect) {
      effect(currentPosition, lastPositionRef.current);
    }

    lastPositionRef.current = currentPosition;
  };

  useEffect(() => {
    const opts = {
      passive: true,
    };
    handleScroll();
    window.addEventListener('scroll', handleScroll, opts);
    return () => window.removeEventListener('scroll', handleScroll, opts);
  }, deps);
};

export default useScrollPosition;
