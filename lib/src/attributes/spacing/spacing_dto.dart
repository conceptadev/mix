// ignore_for_file: prefer-moving-to-variable

import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'edge_insets_dto.dart';

@immutable
class SpacingDto extends EdgeInsetsGeometryDto<SpacingDto> {
  const SpacingDto._({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  const SpacingDto.only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) : this._(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
          start: start,
          end: end,
        );

  static SpacingDto from(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsetsDirectional) {
      return SpacingDto._(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        start: edgeInsets.start,
        end: edgeInsets.end,
      );
    } else if (edgeInsets is EdgeInsets) {
      return SpacingDto._(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
      );
    }

    throw ArgumentError.value(
      edgeInsets,
      'edgeInsets',
      'Must be either EdgeInsets or EdgeInsetsDirectional',
    );
  }

  static SpacingDto? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

  @override
  SpacingDto merge(SpacingDto? other) {
    if (other == null) return this;

    return SpacingDto._(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
      start: other.start ?? start,
      end: other.end ?? end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: mix.tokens.spaceTokenRef(start ?? 0),
            top: mix.tokens.spaceTokenRef(top ?? 0),
            end: mix.tokens.spaceTokenRef(end ?? 0),
            bottom: mix.tokens.spaceTokenRef(bottom ?? 0),
          )
        : EdgeInsets.only(
            left: mix.tokens.spaceTokenRef(left ?? 0),
            top: mix.tokens.spaceTokenRef(top ?? 0),
            right: mix.tokens.spaceTokenRef(right ?? 0),
            bottom: mix.tokens.spaceTokenRef(bottom ?? 0),
          );
  }
}
