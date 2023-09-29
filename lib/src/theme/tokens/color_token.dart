import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class ColorSwatchToken extends ColorSwatch<int> implements MixToken {
  @override
  final String name;

  const ColorSwatchToken(this.name) : super(0, const {});

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorSwatchToken &&
          runtimeType == other.runtimeType &&
          name == other.name;
}

class ColorToken extends Color implements MixToken {
  @override
  final String name;

  const ColorToken(this.name) : super(0);

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorToken &&
          runtimeType == other.runtimeType &&
          name == other.name;
}

typedef MixColorTokens = TokenReferenceMap<ColorToken, Color>;
