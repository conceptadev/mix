import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animation.props.dart';
import 'package:mix/src/attributes/box/box.props.dart';
import 'package:mix/src/attributes/flex/flex.props.dart';
import 'package:mix/src/attributes/icon/icon.props.dart';
import 'package:mix/src/attributes/text/text.props.dart';

import '../../mix.dart';
import '../mixer/recipe_factory.dart';

/// Mix Widget
abstract class MixWidget extends StatelessWidget {
  /// Constructor
  const MixWidget(
    this.mix, {
    Key? key,
  }) : super(key: key);

  final Mix mix;

  @override
  Widget build(BuildContext context);
}

/// Mixer Widget
abstract class MixerWidget extends StatelessWidget {
  /// Constructor
  const MixerWidget(
    this.recipe, {
    Key? key,
  }) : super(key: key);

  AnimationProps get props => recipe.animation.build();
  BoxProps get boxProps => recipe.box.build();
  TextProps get textProps => recipe.text.build();
  IconProps get iconProps => recipe.icon.build();
  FlexProps get flexProps => recipe.flex.build();

  final Recipe recipe;

  @override
  Widget build(BuildContext context);
}
