import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/refs/color_tokens.dart';
import 'package:mix/src/theme/refs/typography_tokens.dart';

abstract class MixRef<T> {
  const MixRef([this.id]);
  final String? id;
}

class TextStyleRef extends TextStyle implements MixRef<TextStyle> {
  const TextStyleRef(this.id) : super();
  @override
  final String id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleRef && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class ColorRef extends Color implements MixRef<Color> {
  const ColorRef(this.id) : super(0);
  @override
  final String id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorRef && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

typedef RefMap<T extends MixRef<V>, V> = Map<T, RefValueGetter<V>>;

typedef RefValueGetter<T> = T Function(BuildContext);

class ContextRefTokens {
  ContextRefTokens(this.tokens);

  final RefMap tokens;

  static ContextRefTokens get defaults {
    final RefMap refMap = {
      $h1: (BuildContext context) {
        return context.textTheme.headline1;
      },
      $h2: (BuildContext context) {
        return context.textTheme.headline2;
      },
      $h3: (BuildContext context) {
        return context.textTheme.headline3;
      },
      $h4: (BuildContext context) {
        return context.textTheme.headline4;
      },
      $h5: (BuildContext context) {
        return context.textTheme.headline5;
      },
      $h6: (BuildContext context) {
        return context.textTheme.headline6;
      },
      $subtitle1: (BuildContext context) {
        return context.textTheme.subtitle1;
      },
      $subtitle2: (BuildContext context) {
        return context.textTheme.subtitle2;
      },
      $body1: (BuildContext context) {
        return context.textTheme.bodyText1;
      },
      $body2: (BuildContext context) {
        return context.textTheme.bodyText2;
      },
      $caption: (BuildContext context) {
        return context.textTheme.caption;
      },
      $button: (BuildContext context) {
        return context.textTheme.button;
      },
      $overline: (BuildContext context) {
        return context.textTheme.overline;
      },
      $primary: (BuildContext context) {
        return context.colorScheme.primary;
      },
      $primaryVariant: (BuildContext context) {
        return context.colorScheme.primaryVariant;
      },
      $secondary: (BuildContext context) {
        return context.colorScheme.secondary;
      },
      $secondaryVariant: (BuildContext context) {
        return context.colorScheme.secondaryVariant;
      },
      $surface: (BuildContext context) {
        return context.colorScheme.surface;
      },
      $background: (BuildContext context) {
        return context.colorScheme.background;
      },
      $error: (BuildContext context) {
        return context.colorScheme.error;
      },
      $onPrimary: (BuildContext context) {
        return context.colorScheme.onPrimary;
      },
      $onSecondary: (BuildContext context) {
        return context.colorScheme.onSecondary;
      },
      $onSurface: (BuildContext context) {
        return context.colorScheme.onSurface;
      },
      $onBackground: (BuildContext context) {
        return context.colorScheme.onBackground;
      },
      $onError: (BuildContext context) {
        return context.colorScheme.onError;
      },
    };

    return ContextRefTokens(refMap);
  }

  RefValueGetter<dynamic>? operator [](MixRef<dynamic> ref) => tokens[ref];

  ContextRefTokens merge(ContextRefTokens? other) {
    if (other == null) return this;

    RefMap merged = {};

    merged
      ..addAll(tokens)
      ..addAll(other.tokens);

    return ContextRefTokens(merged);
  }
}

enum SizeRefName {
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

extension SizeTokenExtension on SizeRefName {
  double get ref {
    switch (this) {
      case SizeRefName.xsmall:
        return -0.1;
      case SizeRefName.small:
        return -0.2;
      case SizeRefName.medium:
        return -0.3;
      case SizeRefName.large:
        return -0.4;
      case SizeRefName.xlarge:
        return -0.5;
      case SizeRefName.xxlarge:
        return -0.6;
      default:
        throw Exception('Invalid SizeToken');
    }
  }
}

class MixToken {
  const MixToken._();

  static double get xsmall => SizeRefName.xsmall.ref;
  static double get small => SizeRefName.small.ref;
  static double get medium => SizeRefName.medium.ref;
  static double get large => SizeRefName.large.ref;
  static double get xlarge => SizeRefName.xlarge.ref;
  static double get xxlarge => SizeRefName.xxlarge.ref;
}

class WithSizeRefs<T> {
  const WithSizeRefs(T Function(double value) fn) : _fn = fn;

  final T Function(double value) _fn;

  T call(double value) => _fn(value);

  T get xsmall => call(SizeRefName.xsmall.ref);
  T get xs => xsmall;

  T get small => call(SizeRefName.small.ref);
  T get sm => small;

  T get medium => call(SizeRefName.medium.ref);
  T get md => medium;

  T get large => call(SizeRefName.large.ref);
  T get lg => large;

  T get xlarge => call(SizeRefName.xlarge.ref);
  T get xl => xlarge;

  T get xxlarge => call(SizeRefName.xxlarge.ref);
  T get xxl => xxlarge;
}
