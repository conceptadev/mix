// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'edge_insets_dto.g.dart';

@immutable
sealed class EdgeInsetsGeometryDto<T extends EdgeInsetsGeometry>
    extends Dto<T> {
  final double? top;
  final double? bottom;

  const EdgeInsetsGeometryDto({this.top, this.bottom});
}

@MixableDto(generateValueExtension: false)
final class EdgeInsetsDto extends EdgeInsetsGeometryDto<EdgeInsets>
    with _$EdgeInsetsDto {
  final double? left;
  final double? right;

  @override
  final defaultValue = EdgeInsets.zero;
  const EdgeInsetsDto({super.top, super.bottom, this.left, this.right});

  @override
  EdgeInsets resolve(MixData mix) {
    return EdgeInsets.only(
      left: left ?? defaultValue.left,
      top: top ?? defaultValue.top,
      right: right ?? defaultValue.right,
      bottom: bottom ?? defaultValue.bottom,
    );
  }
}

@MixableDto(generateValueExtension: false)
final class EdgeInsetsDirectionalDto
    extends EdgeInsetsGeometryDto<EdgeInsetsDirectional>
    with _$EdgeInsetsDirectionalDto {
  final double? start;
  final double? end;

  @override
  final defaultValue = EdgeInsetsDirectional.zero;
  const EdgeInsetsDirectionalDto({
    super.top,
    super.bottom,
    this.start,
    this.end,
  });

  @override
  EdgeInsetsDirectional resolve(MixData mix) {
    return EdgeInsetsDirectional.only(
      start: start ?? defaultValue.start,
      top: top ?? defaultValue.top,
      end: end ?? defaultValue.end,
      bottom: bottom ?? defaultValue.bottom,
    );
  }
}
