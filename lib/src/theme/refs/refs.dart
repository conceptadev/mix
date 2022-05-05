import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/src/helpers/extensions.dart';

import '../tokens/color_scheme_tokens.dart';
import '../tokens/text_theme_tokens.dart';

abstract class MixRef<T> {
  const MixRef([this.id]);
  final String? id;
  T resolve(BuildContext context);
}

typedef RefMap<T extends MixRef<V>, V> = Map<T, RefValueGetter<V>>;

typedef RefValueGetter<T> = T Function(BuildContext);

final RefMap _themeTokens = {
  $headline1: (BuildContext context) {
    return context.textTheme.headline1;
  },
  $headline2: (BuildContext context) {
    return context.textTheme.headline2;
  },
  $headline3: (BuildContext context) {
    return context.textTheme.headline3;
  },
  $headline4: (BuildContext context) {
    return context.textTheme.headline4;
  },
  $headline5: (BuildContext context) {
    return context.textTheme.headline5;
  },
  $headline6: (BuildContext context) {
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
  $secondary: (BuildContext context) {
    return context.colorScheme.secondary;
  },
  $tertiary: (BuildContext context) {
    return context.colorScheme.tertiary;
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
  $onTertiary: (BuildContext context) {
    return context.colorScheme.onTertiary;
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

class ContextRefTokens {
  final RefMap tokens;

  const ContextRefTokens.raw(this.tokens);

  static ContextRefTokens get defaults => ContextRefTokens.raw(_themeTokens);

  RefValueGetter<dynamic>? operator [](MixRef<dynamic> ref) => tokens[ref];

  ContextRefTokens merge(ContextRefTokens? other) {
    if (other == null || other == this) return this;

    final mergedRefs = {...tokens, ...other.tokens};
    return ContextRefTokens.raw(mergedRefs);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContextRefTokens && other.tokens == tokens;
  }

  @override
  int get hashCode => tokens.hashCode;

  @override
  String toString() => 'ContextRefTokens(tokens: $tokens)';
}
