import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class ColorToken extends Color implements MixToken<Color> {
  @override
  final String name;

  const ColorToken(this.name) : super(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is ColorToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class ResolvableColorToken extends ColorToken {
  final Color Function(BuildContext context) _resolver;
  const ResolvableColorToken(String name, this._resolver) : super(name);

  Color resolve(BuildContext context) => _resolver(context);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is ResolvableColorToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class TextStyleToken extends TextStyle implements MixToken<TextStyle> {
  @override
  final String name;

  const TextStyleToken(this.name);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is TextStyleToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class ResolvableTextStyleToken extends TextStyleToken {
  final TextStyle Function(BuildContext context) _resolver;
  const ResolvableTextStyleToken(super.name, this._resolver);

  TextStyle resolve(BuildContext context) => _resolver(context);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is ResolvableTextStyleToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class RadiiToken extends Radius implements MixToken<Radius> {
  @override
  final String name;

  const RadiiToken(this.name) : super.circular(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is RadiiToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class ResolvableRadiiToken extends RadiiToken {
  final Radius Function(BuildContext context) _resolver;
  const ResolvableRadiiToken(super.name, this._resolver);

  Radius resolve(BuildContext context) => _resolver(context);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is ResolvableRadiiToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
