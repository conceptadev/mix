import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../theme/tokens/space_token.dart';
import '../scalars/scalar_util.dart';
import 'spacing_dto.dart';

@immutable
class SpacingUtility<T extends StyleAttribute>
    extends DtoUtility<T, SpacingDto, EdgeInsetsGeometry> {
  late final directional = SpacingDirectionalUtility(builder);

  late final horizontal = SpacingSideUtility((v) => only(left: v, right: v));

  late final vertical = SpacingSideUtility((v) => only(top: v, bottom: v));

  late final all = SpacingSideUtility(
    (v) => only(top: v, bottom: v, left: v, right: v),
  );

  late final top = SpacingSideUtility((v) => only(top: v));

  late final bottom = SpacingSideUtility((v) => only(bottom: v));

  late final left = SpacingSideUtility((v) => only(left: v));

  late final right = SpacingSideUtility((v) => only(right: v));

  late final start = SpacingSideUtility((v) => only(start: v));

  late final end = SpacingSideUtility((v) => only(end: v));

  SpacingUtility(super.builder) : super(valueToDto: SpacingDto.from);

  T call(double p1, [double? p2, double? p3, double? p4]) {
    return only(
      top: p1,
      bottom: p3 ?? p1,
      left: p4 ?? p2 ?? p1,
      right: p2 ?? p1,
    );
  }

  @override
  T only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return builder(
      SpacingDto.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        start: start,
        end: end,
      ),
    );
  }
}

@immutable
class SpacingDirectionalUtility<T extends StyleAttribute>
    extends DtoUtility<T, SpacingDto, EdgeInsetsGeometry> {
  late final all = SpacingSideUtility(
    (v) => only(top: v, bottom: v, start: v, end: v),
  );

  late final start = SpacingSideUtility((v) => only(start: v));

  late final end = SpacingSideUtility((v) => only(end: v));

  late final top = SpacingSideUtility((v) => only(top: v));

  late final bottom = SpacingSideUtility((v) => only(bottom: v));

  late final vertical = SpacingSideUtility((v) => only(top: v, bottom: v));

  late final horizontal = SpacingSideUtility((v) => only(start: v, end: v));

  SpacingDirectionalUtility(super.builder) : super(valueToDto: SpacingDto.from);

  T call(double p1, [double? p2, double? p3, double? p4]) {
    return only(
      top: p1,
      bottom: p3 ?? p1,
      start: p4 ?? p2 ?? p1,
      end: p2 ?? p1,
    );
  }

  @override
  T only({double? top, double? bottom, double? start, double? end}) {
    return builder(
      SpacingDto.only(top: top, bottom: bottom, start: start, end: end),
    );
  }
}

@immutable
class SpacingSideUtility<T extends StyleAttribute>
    extends StyleUtility<T, double> {
  const SpacingSideUtility(super.builder);

  T call(double value) => builder(value);

  T ref(SpaceToken ref) => builder(ref());
}
