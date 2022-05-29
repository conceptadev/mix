import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'tokens.dart';

class ColorSwatchToken extends ColorSwatch<int>
    implements MixToken<ColorSwatch> {
  const ColorSwatchToken(this.id, this.getter) : super(0, const {});

  @override
  final TokenValueGetter<ColorSwatch> getter;

  @override
  final String id;

  @override
  ColorSwatch resolve(BuildContext context) {
    return getter(context);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorToken && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ColorSwatchToken(id: $id)';
}

class ColorToken extends Color implements MixToken<Color> {
  const ColorToken(this.id, this.getter) : super(0);

  @override
  final String id;

  @override
  final TokenValueGetter<Color> getter;

  @override
  Color resolve(BuildContext context) {
    return getter(context);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorToken && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ColorToken(id: $id)';
}
