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

  const SpacingDto.all(double value)
      : this.only(top: value, bottom: value, left: value, right: value);

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

extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  SpacingDto toDto() {
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toDto();
    } else if (this is EdgeInsets) {
      return (this as EdgeInsets).toDto();
    }

    throw ArgumentError.value(
      this,
      'edgeInsets',
      'Must be either EdgeInsets or EdgeInsetsDirectional',
    );
  }
}

extension EdgeInsetsExt on EdgeInsets {
  SpacingDto toDto() {
    return SpacingDto._(top: top, bottom: bottom, left: left, right: right);
  }
}

extension EdgeInsetsDirectionalExt on EdgeInsetsDirectional {
  SpacingDto toDto() {
    return SpacingDto._(top: top, bottom: bottom, start: start, end: end);
  }
}
