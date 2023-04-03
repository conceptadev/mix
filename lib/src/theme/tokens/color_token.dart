import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class ColorSwatchToken extends ColorSwatch<int> implements MixToken {
  const ColorSwatchToken(this.name) : super(0, const {});

  @override
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorSwatchToken &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
}

class ColorToken extends Color implements MixToken {
  const ColorToken(this.name) : super(0);

  @override
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorToken &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
}

typedef MixColorTokens = TokenReferenceMap<ColorToken, Color>;
