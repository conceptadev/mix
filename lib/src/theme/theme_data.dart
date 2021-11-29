import 'package:mix/src/theme/breakpoints.dart';

import '../attributes/common/attribute.dart';
import '../mixer/mix_factory.dart';
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
      tokens: {},
    );
  }

  final MixThemeSpaceData spacing;
  final MixThemeBreakpointsData breakpoints;
  final RefMap tokens;

  MixThemeData copyWith({
    MixThemeSpaceData? spacing,
    MixThemeBreakpointsData? breakpoints,
    RefMap? tokens,
  }) {
    return MixThemeData._(
      spacing: spacing ?? this.spacing,
      breakpoints: breakpoints ?? this.breakpoints,
      tokens: tokens ?? this.tokens,
    );
  }

  MixThemeData merge(MixThemeData? other) {
    if (other == null) {
      return this;
    }
    return copyWith(
      spacing: other.spacing,
      tokens: other.tokens,
      breakpoints: other.breakpoints,
    );
  }

  Mix<T>? getToken<T extends Attribute>(Symbol key) {
    return tokens[key] as Mix<T>?;
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
