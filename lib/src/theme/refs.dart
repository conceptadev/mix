import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../attributes/common/attribute.dart';

//TODO implement ref
// abstract class MixRef {}

typedef RefMap = Map<String, TokenValueGetter<Attribute>>;

typedef TokenValueGetter<T extends Attribute> = T Function(BuildContext);

class MixThemeTokensData {
  MixThemeTokensData(this.tokens);

  final RefMap tokens;

  static MixThemeTokensData get defaults {
    final refMap = {
      'headline1': (BuildContext ctx) => textStyle(ctx.tt.headline1),
      'headline2': (BuildContext ctx) => textStyle(ctx.tt.headline2),
      'headline3': (BuildContext ctx) => textStyle(ctx.tt.headline3),
      'headline4': (BuildContext ctx) => textStyle(ctx.tt.headline4),
      'headline5': (BuildContext ctx) => textStyle(ctx.tt.headline5),
      'headline6': (BuildContext ctx) => textStyle(ctx.tt.headline6),
      'subtitle1': (BuildContext ctx) => textStyle(ctx.tt.subtitle1),
      'subtitle2': (BuildContext ctx) => textStyle(ctx.tt.subtitle2),
      'bodyText1': (BuildContext ctx) => textStyle(ctx.tt.bodyText1),
      'bodyText2': (BuildContext ctx) => textStyle(ctx.tt.bodyText2),
      'caption': (BuildContext ctx) => textStyle(ctx.tt.caption),
      'button': (BuildContext ctx) => textStyle(ctx.tt.button),
      'overline': (BuildContext ctx) => textStyle(ctx.tt.overline),
    };

    return MixThemeTokensData(refMap);
  }

  MixThemeTokensData merge(MixThemeTokensData? other) {
    if (other == null) return this;

    RefMap merged = {};

    merged
      ..addAll(tokens)
      ..addAll(other.tokens);

    return MixThemeTokensData(merged);
  }
}

enum SizeToken {
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

extension SizeTokenExtension on SizeToken {
  double get ref {
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

class MixToken {
  const MixToken._();

  static double get xsmall => SizeToken.xsmall.ref;
  static double get small => SizeToken.small.ref;
  static double get medium => SizeToken.medium.ref;
  static double get large => SizeToken.large.ref;
  static double get xlarge => SizeToken.xlarge.ref;
  static double get xxlarge => SizeToken.xxlarge.ref;
}

class WithSizeRefs<T> {
  const WithSizeRefs(T Function(double value) fn) : _fn = fn;

  final T Function(double value) _fn;

  T call(double value) => _fn(value);

  T get xsmall => call(SizeToken.xsmall.ref);
  T get xs => xsmall;

  T get small => call(SizeToken.small.ref);
  T get sm => small;

  T get medium => call(SizeToken.medium.ref);
  T get md => medium;

  T get large => call(SizeToken.large.ref);
  T get lg => large;

  T get xlarge => call(SizeToken.xlarge.ref);
  T get xl => xlarge;

  T get xxlarge => call(SizeToken.xxlarge.ref);
  T get xxl => xxlarge;
}
