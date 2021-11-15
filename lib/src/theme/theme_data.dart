import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

import './theme_spacing.dart';

typedef TokenMap<T extends Attribute> = Map<Symbol, List<T>>;

enum SizeToken {
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

class MixThemeData {
  MixThemeData._({
    required this.spacing,
    required this.tokens,
  });

  static get defaults {
    return MixThemeData._(
      spacing: SpacingData.defaults,
      tokens: {},
    );
  }

  final SpacingData spacing;
  final TokenMap tokens;

  MixThemeData copyWith({
    SpacingData? spacing,
    TokenMap? tokens,
  }) {
    return MixThemeData._(
      spacing: this.spacing.merge(spacing),
      tokens: this.tokens..addAll(tokens ?? {}),
    );
  }

  MixThemeData merge(MixThemeData? other) {
    if (other == null) {
      return this;
    }
    return copyWith(
      spacing: other.spacing,
      tokens: other.tokens,
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
        other.tokens == tokens;
  }

  @override
  int get hashCode => spacing.hashCode ^ tokens.hashCode;
}
