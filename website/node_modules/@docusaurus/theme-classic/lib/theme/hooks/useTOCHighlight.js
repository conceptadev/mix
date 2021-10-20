"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = require("react");

var _themeCommon = require("@docusaurus/theme-common");

/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
// If the anchor has no height and is just a "marker" in the dom; we'll use the parent (normally the link text) rect boundaries instead
function getVisibleBoundingClientRect(element) {
  const rect = element.getBoundingClientRect();
  const hasNoHeight = rect.top === rect.bottom;

  if (hasNoHeight) {
    return getVisibleBoundingClientRect(element.parentNode);
  }

  return rect;
} // Considering we divide viewport into 2 zones of each 50vh
// This returns true if an element is in the first zone (ie, appear in viewport, near the top)


function isInViewportTopHalf(boundingRect) {
  return boundingRect.top > 0 && boundingRect.bottom < window.innerHeight / 2;
}

function getAnchors() {
  // For toc highlighting, we only consider h2/h3 anchors
  const selector = '.anchor.anchor__h2, .anchor.anchor__h3';
  return Array.from(document.querySelectorAll(selector));
}

function getActiveAnchor({
  anchorTopOffset
}) {
  const anchors = getAnchors(); // Naming is hard
  // The "nextVisibleAnchor" is the first anchor that appear under the viewport top boundary
  // Note: it does not mean this anchor is visible yet, but if user continues scrolling down, it will be the first to become visible

  const nextVisibleAnchor = anchors.find(anchor => {
    const boundingRect = getVisibleBoundingClientRect(anchor);
    return boundingRect.top >= anchorTopOffset;
  });

  if (nextVisibleAnchor) {
    const boundingRect = getVisibleBoundingClientRect(nextVisibleAnchor); // If anchor is in the top half of the viewport: it is the one we consider "active"
    // (unless it's too close to the top and and soon to be scrolled outside viewport)

    if (isInViewportTopHalf(boundingRect)) {
      return nextVisibleAnchor;
    } // If anchor is in the bottom half of the viewport, or under the viewport, we consider the active anchor is the previous one
    // This is because the main text appearing in the user screen mostly belong to the previous anchor
    else {
        var _anchors;

        // Returns null for the first anchor, see https://github.com/facebook/docusaurus/issues/5318
        return (_anchors = anchors[anchors.indexOf(nextVisibleAnchor) - 1]) !== null && _anchors !== void 0 ? _anchors : null;
      }
  } // no anchor under viewport top? (ie we are at the bottom of the page)
  // => highlight the last anchor found
  else {
      return anchors[anchors.length - 1];
    }
}

function getLinkAnchorValue(link) {
  return decodeURIComponent(link.href.substring(link.href.indexOf('#') + 1));
}

function getLinks(linkClassName) {
  return Array.from(document.getElementsByClassName(linkClassName));
}

function getNavbarHeight() {
  // Not ideal to obtain actual height this way
  // Using TS ! (not ?) because otherwise a bad selector would be un-noticed
  return document.querySelector('.navbar').clientHeight;
}

function useAnchorTopOffsetRef() {
  const anchorTopOffsetRef = (0, _react.useRef)(0);
  const {
    navbar: {
      hideOnScroll
    }
  } = (0, _themeCommon.useThemeConfig)();
  (0, _react.useEffect)(() => {
    anchorTopOffsetRef.current = hideOnScroll ? 0 : getNavbarHeight();
  }, [hideOnScroll]);
  return anchorTopOffsetRef;
}

function useTOCHighlight(params) {
  const lastActiveLinkRef = (0, _react.useRef)(undefined);
  const anchorTopOffsetRef = useAnchorTopOffsetRef();
  (0, _react.useEffect)(() => {
    const {
      linkClassName,
      linkActiveClassName
    } = params;

    function updateLinkActiveClass(link, active) {
      if (active) {
        if (lastActiveLinkRef.current && lastActiveLinkRef.current !== link) {
          var _lastActiveLinkRef$cu;

          (_lastActiveLinkRef$cu = lastActiveLinkRef.current) === null || _lastActiveLinkRef$cu === void 0 ? void 0 : _lastActiveLinkRef$cu.classList.remove(linkActiveClassName);
        }

        link.classList.add(linkActiveClassName);
        lastActiveLinkRef.current = link;
      } else {
        link.classList.remove(linkActiveClassName);
      }
    }

    function updateActiveLink() {
      const links = getLinks(linkClassName);
      const activeAnchor = getActiveAnchor({
        anchorTopOffset: anchorTopOffsetRef.current
      });
      const activeLink = links.find(link => activeAnchor && activeAnchor.id === getLinkAnchorValue(link));
      links.forEach(link => {
        updateLinkActiveClass(link, link === activeLink);
      });
    }

    document.addEventListener('scroll', updateActiveLink);
    document.addEventListener('resize', updateActiveLink);
    updateActiveLink();
    return () => {
      document.removeEventListener('scroll', updateActiveLink);
      document.removeEventListener('resize', updateActiveLink);
    };
  }, [params, anchorTopOffsetRef]);
}

var _default = useTOCHighlight;
exports.default = _default;