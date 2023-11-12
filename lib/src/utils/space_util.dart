import 'package:flutter/material.dart';

import '../attributes/space_attribute.dart';
import '../theme/tokens/space_token.dart';

const _padding = SpaceUtilityFactory<PaddingAttribute>(PaddingAttribute.new);

const _paddingDirectional =
    SpaceDirectionalUtilityFactory<PaddingDirectionalAttribute>(
  PaddingDirectionalAttribute.new,
);

final padding = UtilityWithSpaceTokens.shorthand(_padding.shorthand);
final paddingOnly = _padding.only;
final paddingDirectional =
    UtilityWithSpaceTokens.shorthand(_paddingDirectional.shorthand);
final paddingDirectionalOnly = _paddingDirectional.only;

final paddingTop = UtilityWithSpaceTokens(_padding.top);
final paddingBottom = UtilityWithSpaceTokens(_padding.bottom);
final paddingLeft = UtilityWithSpaceTokens(_padding.left);
final paddingRight = UtilityWithSpaceTokens(_padding.right);
final paddingStart = UtilityWithSpaceTokens(_paddingDirectional.start);
final paddingEnd = UtilityWithSpaceTokens(_paddingDirectional.end);

final paddingHorizontal = UtilityWithSpaceTokens(_padding.horizontal);
final paddingVertical = UtilityWithSpaceTokens(_padding.vertical);
final paddingFrom = _padding.from;

const _marginFactory =
    SpaceUtilityFactory<MarginAttribute>(MarginAttribute.new);

const _marginDirectionalFactory =
    SpaceDirectionalUtilityFactory<MarginDirectionalAttribute>(
  MarginDirectionalAttribute.new,
);

final margin = UtilityWithSpaceTokens.shorthand(_marginFactory.shorthand);
final marginOnly = _marginFactory.only;
final marginDirectional =
    UtilityWithSpaceTokens.shorthand(_marginDirectionalFactory.shorthand);
final marginDirectionalOnly = _marginDirectionalFactory.only;
final marginTop = UtilityWithSpaceTokens(_marginFactory.top);
final marginBottom = UtilityWithSpaceTokens(_marginFactory.bottom);
final marginLeft = UtilityWithSpaceTokens(_marginFactory.left);
final marginRight = UtilityWithSpaceTokens(_marginFactory.right);
final marginStart = UtilityWithSpaceTokens(_marginDirectionalFactory.start);
final marginEnd = UtilityWithSpaceTokens(_marginDirectionalFactory.end);

final marginHorizontal = UtilityWithSpaceTokens(_marginFactory.horizontal);
final marginVertical = UtilityWithSpaceTokens(_marginFactory.vertical);
final marginFrom = _marginFactory.from;

@immutable
class SpaceUtilityFactory<T extends SpaceGeometryAttribute> {
  final T Function({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) _builder;

  const SpaceUtilityFactory(this._builder);

  T shorthand(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) right = p4;

    return _builder(bottom: bottom, left: left, right: right, top: top);
  }

  T from(EdgeInsets edgeInsets) {
    return _builder(
      bottom: edgeInsets.bottom,
      left: edgeInsets.left,
      right: edgeInsets.right,
      top: edgeInsets.top,
    );
  }

  T only(double? top, double? bottom, double? left, double? right) {
    return _builder(bottom: bottom, left: left, right: right, top: top);
  }

  T top(double value) => _builder(top: value);
  T bottom(double value) => _builder(bottom: value);
  T left(double value) => _builder(left: value);
  T right(double value) => _builder(right: value);

  T horizontal(double value) => _builder(left: value, right: value);

  T vertical(double value) => _builder(bottom: value, top: value);
}

@immutable
class SpaceDirectionalUtilityFactory<T extends SpaceDirectionalAttribute> {
  final T Function({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) _builder;

  const SpaceDirectionalUtilityFactory(this._builder);

  T all(double all) {
    return _builder(bottom: all, end: all, start: all, top: all);
  }

  T top(double value) => _builder(top: value);
  T bottom(double value) => _builder(bottom: value);
  T start(double value) => _builder(start: value);
  T end(double value) => _builder(end: value);

  T from(EdgeInsetsDirectional edgeInsets) {
    return _builder(
      bottom: edgeInsets.bottom,
      end: edgeInsets.end,
      start: edgeInsets.start,
      top: edgeInsets.top,
    );
  }

  T only(double? top, double? bottom, double? start, double? end) {
    return _builder(bottom: bottom, end: end, start: start, top: top);
  }

  T vertical(double value) => _builder(bottom: value, top: value);

  T horizontal(double value) => _builder(end: value, start: value);

  T shorthand(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double start = p1;
    double end = p1;

    if (p2 != null) {
      start = p2;
      end = p2;
    }

    if (p3 != null) bottom = p3;

    if (p4 != null) end = p4;

    return _builder(bottom: bottom, end: end, start: start, top: top);
  }
}
