// ignore_for_file: avoid-shadowing

import 'package:flutter/material.dart';

import '../attributes/space_attribute.dart';
import '../theme/tokens/space_token.dart';

const padding = SpaceUtility(PaddingAttribute.new);
const paddingDirectional =
    SpaceDirectionalUtility(PaddingDirectionalAttribute.new);

const margin = SpaceUtility(MarginAttribute.new);
const marginDirectional =
    SpaceDirectionalUtility(MarginDirectionalAttribute.new);

typedef SpaceUtilityFn<T extends SpaceAttribute> = T Function({
  double? top,
  double? bottom,
  double? left,
  double? right,
});

typedef SpaceDirectionalUtilityFn<T extends SpaceDirectionalAttribute> = T
    Function({double? top, double? bottom, double? start, double? end});

@immutable
class SpaceDirectionalUtility<T extends SpaceDirectionalAttribute> {
  final SpaceDirectionalUtilityFn<T> fn;

  const SpaceDirectionalUtility(this.fn);

  SpaceDirectionalUtilityFn<T> get only => fn;

  WithSpaceToken<T> get all => WithSpaceToken(_all);
  WithSpaceToken<T> get start => WithSpaceToken(_start);
  WithSpaceToken<T> get end => WithSpaceToken(_end);
  WithSpaceToken<T> get top => WithSpaceToken(_top);
  WithSpaceToken<T> get bottom => WithSpaceToken(_bottom);
  WithSpaceToken<T> get vertical => WithSpaceToken(_vertical);
  WithSpaceToken<T> get horizontal => WithSpaceToken(_horizontal);

  T from(EdgeInsetsDirectional edgeInsets) {
    return fn(
      bottom: edgeInsets.bottom,
      end: edgeInsets.end,
      start: edgeInsets.start,
      top: edgeInsets.top,
    );
  }

  T call(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double start = p1;
    double end = p1;

    if (p2 != null) {
      start = p2;
      end = p2;
    }

    if (p3 != null) bottom = p3;

    if (p4 != null) start = p4;

    return fn(bottom: bottom, end: end, start: start, top: top);
  }

  T _all(double value) =>
      fn(bottom: value, end: value, start: value, top: value);
  T _start(double value) => fn(start: value);
  T _end(double value) => fn(end: value);
  T _top(double value) => fn(top: value);
  T _bottom(double value) => fn(bottom: value);
  T _vertical(double value) => fn(bottom: value, top: value);
  T _horizontal(double value) => fn(end: value, start: value);
}

@immutable
class SpaceUtility<T extends SpaceAttribute> {
  final SpaceUtilityFn<T> _fn;
  const SpaceUtility(this._fn);

  SpaceUtilityFn<T> get only => _fn;

  WithSpaceToken<T> get vertical => WithSpaceToken(_vertical);
  WithSpaceToken<T> get horizontal => WithSpaceToken(_horizontal);
  WithSpaceToken<T> get all => WithSpaceToken(_all);
  WithSpaceToken<T> get top => WithSpaceToken(_top);
  WithSpaceToken<T> get bottom => WithSpaceToken(_bottom);
  WithSpaceToken<T> get left => WithSpaceToken(_left);
  WithSpaceToken<T> get right => WithSpaceToken(_right);

  // Factory method to create a SpaceAttribute from EdgeInsets
  T from(EdgeInsets edgeInsets) {
    return _fn(
      bottom: edgeInsets.bottom,
      left: edgeInsets.left,
      right: edgeInsets.right,
      top: edgeInsets.top,
    );
  }

  // Callable method to handle custom space attributes

  T call(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) left = p4;

    return _fn(bottom: bottom, left: left, right: right, top: top);
  }

  T _all(double value) =>
      _fn(bottom: value, left: value, right: value, top: value);
  T _top(double value) => _fn(top: value);
  T _bottom(double value) => _fn(bottom: value);
  T _left(double value) => _fn(left: value);
  T _right(double value) => _fn(right: value);

  T _horizontal(double value) => _fn(left: value, right: value);
  T _vertical(double value) => _fn(bottom: value, top: value);
}

// Helper class to wrap functions that can return
// Space tokens in their methods
@immutable
class WithSpaceToken<T> {
  final T Function(double value) _fn;

  const WithSpaceToken(T Function(double value) fn) : _fn = fn;

  T get xsmall => call(SpaceToken.xsmall());

  T get small => call(SpaceToken.small());

  T get medium => call(SpaceToken.medium());

  T get large => call(SpaceToken.large());

  T get xlarge => call(SpaceToken.xlarge());

  T get xxlarge => call(SpaceToken.xxlarge());

  T call(double value) => _fn(value);
}
