import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import './theme_data.dart';

class SpacingData {
  const SpacingData._({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.xxlarge,
  });

  static get defaults {
    return const SpacingData._(
      xsmall: 2,
      small: 4,
      medium: 8,
      large: 16,
      xlarge: 32,
      xxlarge: 64,
    );
  }

  final translationKeys = const {
    SizeToken.xsmall: -0.1,
    SizeToken.small: -0.2,
    SizeToken.medium: -0.3,
    SizeToken.large: -0.4,
    SizeToken.xlarge: -0.5,
    SizeToken.xxlarge: -0.6,
  };

  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;

  double getValue(SizeToken key) {
    switch (key) {
      case SizeToken.xsmall:
        return xsmall;
      case SizeToken.small:
        return small;
      case SizeToken.medium:
        return medium;
      case SizeToken.large:
        return large;
      case SizeToken.xlarge:
        return xlarge;
      case SizeToken.xxlarge:
        return xxlarge;
      default:
        throw Exception('Invalid SizeToken');
    }
  }

// Translates double value into its translated value
  EdgeInsets _translate(EdgeInsets edgeInsets, SpacingData data) {
    double top = edgeInsets.top;
    double bottom = edgeInsets.bottom;
    double left = edgeInsets.left;
    double right = edgeInsets.right;
    // Get value from spacing if entry matches key value
    for (var entry in translationKeys.entries) {
      final value = entry.value;
      top = top == value ? getValue(entry.key) : top;
      bottom = bottom == value ? getValue(entry.key) : bottom;
      left = left == value ? getValue(entry.key) : left;
      right = right == value ? getValue(entry.key) : right;
    }
    return EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }

  EdgeInsets? applyEdgeInsets(BuildContext context, EdgeInsets? edgeInsets) {
    if (edgeInsets != null) {
      final spacingData = context.spacingData();

      return _translate(edgeInsets, spacingData);
    }
  }

  SpacingData merge(SpacingData? other) {
    return SpacingData._(
      xsmall: other?.xsmall ?? xsmall,
      small: other?.small ?? small,
      medium: other?.medium ?? medium,
      large: other?.large ?? large,
      xlarge: other?.xlarge ?? xlarge,
      xxlarge: other?.xxlarge ?? xxlarge,
    );
  }
}
