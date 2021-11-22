import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

import 'spacing.dart';

typedef TokenMap<T extends Attribute> = Map<Symbol, List<T>>;

enum SizeToken {
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

extension SizeTokenExtension on SizeToken {
  double get value {
    switch (this) {
      case SizeToken.xsmall:
        return -0.1;
      case SizeToken.small:
        return -0.2;
      case SizeToken.medium:
        return -0.3;
      case SizeToken.large:
        return -0.4;
      case SizeToken.xlarge:
        return -0.5;
      case SizeToken.xxlarge:
        return -0.6;
      default:
        throw Exception('Invalid SizeToken');
    }
  }
}

class MixThemeData {
  MixThemeData._({
    required this.spacing,
    required this.tokens,
  });

  static get defaults {
    return MixThemeData._(
      spacing: MixThemeSpaceData.defaults,
      tokens: {},
    );
  }

  final MixThemeSpaceData spacing;
  final TokenMap tokens;

  MixThemeData copyWith({
    MixThemeSpaceData? spacing,
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
