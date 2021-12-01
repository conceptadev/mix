import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/breakpoints.dart';

import 'refs.dart';
import 'spacing.dart';

class MixThemeData {
  MixThemeData._({
    required this.spacing,
    required this.tokens,
    required this.breakpoints,
  });

  static get defaults {
    return MixThemeData._(
      spacing: MixThemeSpaceData.defaults,
      breakpoints: MixThemeBreakpointsData.defaults,
      tokens: MixThemeTokensData.defaults,
    );
  }

  final MixThemeSpaceData spacing;
  final MixThemeBreakpointsData breakpoints;
  final MixThemeTokensData tokens;

  Attribute getToken(String token, BuildContext context) {
    final value = tokens.tokens[token]?.call(context);
    if (value == null) {
      throw Exception('Token $token not found');
    }
    return value;
  }

  MixThemeData copyWith({
    MixThemeSpaceData? spacing,
    MixThemeBreakpointsData? breakpoints,
    MixThemeTokensData? tokens,
  }) {
    return MixThemeData._(
      spacing: spacing ?? this.spacing,
      breakpoints: breakpoints ?? this.breakpoints,
      tokens: tokens ?? this.tokens,
    );
  }

  MixThemeData merge(MixThemeData? other) {
    if (other == null) return this;

    return copyWith(
      spacing: other.spacing,
      tokens: other.tokens,
      breakpoints: other.breakpoints,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeData &&
        other.spacing == spacing &&
        other.breakpoints == breakpoints &&
        other.tokens == tokens;
  }

  @override
  int get hashCode => spacing.hashCode ^ breakpoints.hashCode ^ tokens.hashCode;

  @override
  String toString() =>
      'MixThemeData(spacing: $spacing, breakpoints: $breakpoints, tokens: $tokens)';
}
