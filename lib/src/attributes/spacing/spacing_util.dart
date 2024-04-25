import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../theme/tokens/space_token.dart';
import '../scalars/scalar_util.dart';
import 'spacing_dto.dart';

@immutable
class SpacingUtility<T extends StyleAttribute>
    extends DtoUtility<T, SpacingDto, EdgeInsetsGeometry> {
  late final directional = SpacingDirectionalUtility(builder);

  late final horizontal = SpacingSideUtility(
    (double value) => only(left: value, right: value),
  );

  late final vertical = SpacingSideUtility(
    (double value) => only(top: value, bottom: value),
  );

  late final all = SpacingSideUtility(
    (double value) =>
        only(top: value, bottom: value, left: value, right: value),
  );

  late final top = SpacingSideUtility((value) => only(top: value));

  late final bottom = SpacingSideUtility((value) => only(bottom: value));

  late final left = SpacingSideUtility((value) => only(left: value));

  late final right = SpacingSideUtility((value) => only(right: value));

  late final start = SpacingSideUtility((value) => only(start: value));

  late final end = SpacingSideUtility((double value) => only(end: value));

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
    (value) => only(top: value, bottom: value, start: value, end: value),
  );

  late final start = SpacingSideUtility((value) => only(start: value));

  late final end = SpacingSideUtility((value) => only(end: value));

  late final top = SpacingSideUtility((value) => only(top: value));

  late final bottom = SpacingSideUtility((value) => only(bottom: value));

  late final vertical = SpacingSideUtility(
    (value) => only(top: value, bottom: value),
  );

  late final horizontal = SpacingSideUtility(
    (double value) => only(start: value, end: value),
  );

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
    extends MixUtility<T, double> {
  const SpacingSideUtility(super.builder);

  T call(double value) => builder(value);

  T ref(SpaceToken ref) => builder(ref());
}
