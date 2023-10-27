import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../factory/exports.dart';
import '../../helpers/compare_mixin.dart';
import 'mix_token.dart';

// class ColorSwatchRef extends ColorSwatch<int> implements TokenRef<ColorSwatch> {
//   @override
//   final String name;

//   const ColorSwatchRef(this.name) : super(0, const {});

//   get props => [name];
//   @override
//   ColorSwatch resolve(MixData mix) => mix.resolver.colorSwatch(this);
// }

class ColorRef extends Color with Comparable implements TokenRef<Color> {
  @override
  final String name;

  const ColorRef(this.name) : super(0);

  @override
  Color resolve(MixData mix) => mix.resolver.color(this);

  @override
  get props => [name];
}

typedef MixColorTokens = TokenReferenceMap<ColorRef, Color>;
