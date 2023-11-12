import 'package:flutter/material.dart';

import '../attributes/space_attribute.dart';
import '../theme/tokens/space_token.dart';

const _paddingUtil = SpaceUtilityFactory(PaddingAttribute.new);
const _paddingDirectionalUtil =
    SpaceDirectionalUtilityFactory(PaddingDirectionalAttribute.new);

final padding = _paddingUtil.shorthand;
final paddingDirectional = _paddingDirectionalUtil.shorthand;
final paddingOnly = _paddingUtil.only;
final paddingDirectionalOnly = _paddingDirectionalUtil.only;
final paddingAll = UtilityWithSpaceTokens(_paddingUtil.all);
final paddingTop = UtilityWithSpaceTokens(_paddingUtil.top);
final paddingBottom = UtilityWithSpaceTokens(_paddingUtil.bottom);
final paddingLeft = UtilityWithSpaceTokens(_paddingUtil.left);
final paddingRight = UtilityWithSpaceTokens(_paddingUtil.right);
final paddingStart = UtilityWithSpaceTokens(_paddingDirectionalUtil.start);
final paddingEnd = UtilityWithSpaceTokens(_paddingDirectionalUtil.end);
final paddingHorizontal = UtilityWithSpaceTokens(_paddingUtil.horizontal);
final paddingVertical = UtilityWithSpaceTokens(_paddingUtil.vertical);

PaddingGeometryAttribute paddingFrom(EdgeInsetsGeometry edgeInsets) {
  if (edgeInsets is EdgeInsets) {
    return _paddingUtil.from(edgeInsets);
  } else if (edgeInsets is EdgeInsetsDirectional) {
    return _paddingDirectionalUtil.from(edgeInsets);
  }
  throw UnimplementedError(
    'paddingFrom is not implemented for ${edgeInsets.runtimeType}',
  );
}

const _marginUtil = SpaceUtilityFactory(MarginAttribute.new);
const _marginDirectionalUtil =
    SpaceDirectionalUtilityFactory(MarginDirectionalAttribute.new);

final margin = _marginUtil.shorthand;
final marginDirectional = _marginDirectionalUtil.shorthand;
final marginOnly = _marginUtil.only;
final marginDirectionalOnly = _marginDirectionalUtil.only;
final marginAll = UtilityWithSpaceTokens(_marginUtil.all);
final marginTop = UtilityWithSpaceTokens(_marginUtil.top);
final marginBottom = UtilityWithSpaceTokens(_marginUtil.bottom);
final marginLeft = UtilityWithSpaceTokens(_marginUtil.left);
final marginRight = UtilityWithSpaceTokens(_marginUtil.right);
final marginStart = UtilityWithSpaceTokens(_marginDirectionalUtil.start);
final marginEnd = UtilityWithSpaceTokens(_marginDirectionalUtil.end);
final marginHorizontal = UtilityWithSpaceTokens(_marginUtil.horizontal);
final marginVertical = UtilityWithSpaceTokens(_marginUtil.vertical);

MarginGeometryAttribute marginFrom(EdgeInsetsGeometry edgeInsets) {
  if (edgeInsets is EdgeInsets) {
    return _marginUtil.from(edgeInsets);
  } else if (edgeInsets is EdgeInsetsDirectional) {
    return _marginDirectionalUtil.from(edgeInsets);
  }
  throw UnimplementedError(
    'marginFrom is not implemented for ${edgeInsets.runtimeType}',
  );
}

typedef SpaceAttributeBuilder<T extends SpaceAttribute> = T Function({
  double? top,
  double? bottom,
  double? left,
  double? right,
});

@immutable
class SpaceUtilityFactory<T extends SpaceAttribute> {
  final SpaceAttributeBuilder<T> _builder;

  const SpaceUtilityFactory(this._builder);

  SpaceAttributeBuilder<T> get only => _builder;

  T all(double all) => _builder(bottom: all, left: all, right: all, top: all);

  T top(double value) => _builder(top: value);
  T bottom(double value) => _builder(bottom: value);
  T left(double value) => _builder(left: value);
  T right(double value) => _builder(right: value);

  T horizontal(double value) => _builder(left: value, right: value);
  T vertical(double value) => _builder(bottom: value, top: value);

  T from(EdgeInsets edgeInsets) {
    return _builder(
      bottom: edgeInsets.bottom,
      left: edgeInsets.left,
      right: edgeInsets.right,
      top: edgeInsets.top,
    );
  }

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
    if (p4 != null) left = p4;

    return _builder(bottom: bottom, left: left, right: right, top: top);
  }
}

typedef SpaceDirectionalBuilder<T extends SpaceDirectionalAttribute> = T
    Function({double? top, double? bottom, double? start, double? end});

@immutable
class SpaceDirectionalUtilityFactory<T extends SpaceDirectionalAttribute> {
  final SpaceDirectionalBuilder<T> _builder;

  const SpaceDirectionalUtilityFactory(this._builder);

  SpaceDirectionalBuilder<T> get only => _builder;

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

    if (p4 != null) start = p4;

    return _builder(bottom: bottom, end: end, start: start, top: top);
  }
}
