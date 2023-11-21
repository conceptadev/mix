// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'edge_insets_attribute.dart';

@immutable
abstract class SpacingAttribute extends EdgeInsetsGeometryAttribute {
  const SpacingAttribute(super.value);

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    final top = value.top ?? 0;
    final bottom = value.bottom ?? 0;

    if (value is EdgeInsetsDto) {
      final left = value.left ?? 0;
      final right = value.right ?? 0;

      return EdgeInsets.only(
        left: mix.tokens.spaceTokenRef(left),
        top: mix.tokens.spaceTokenRef(top),
        right: mix.tokens.spaceTokenRef(right),
        bottom: mix.tokens.spaceTokenRef(bottom),
      );
    } else if (value is EdgeInsetsDirectionalDto) {
      final start = value.start ?? 0;
      final end = value.end ?? 0;

      return EdgeInsetsDirectional.only(
        start: mix.tokens.spaceTokenRef(start),
        top: mix.tokens.spaceTokenRef(top),
        end: mix.tokens.spaceTokenRef(end),
        bottom: mix.tokens.spaceTokenRef(bottom),
      );
    }
    throw UnsupportedError(
      'EdgeInsetsGeometryDto must be either EdgeInsetsDto or EdgeInsetsDirectionalDto',
    );
  }
}

@immutable
class PaddingAttribute extends SpacingAttribute {
  const PaddingAttribute(super.value);

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    return other == null ? this : PaddingAttribute(value.merge(other.value));
  }
}

@immutable
class MarginAttribute extends SpacingAttribute {
  const MarginAttribute(super.value);

  @override
  MarginAttribute merge(MarginAttribute? other) {
    return other == null ? this : MarginAttribute(value.merge(other.value));
  }
}
