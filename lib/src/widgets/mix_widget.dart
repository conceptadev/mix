import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.props.dart';
import 'package:mix/src/attributes/text/text.props.dart';
import 'package:mix/src/attributes/widget_attributes.dart';

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

  WidgetProps get attributes => recipe.widgetProps.build();
  BoxProps get boxAttributes => recipe.boxProps.build();
  TextProps get textAttributes => recipe.textProps.build();

  final Recipe recipe;

  @override
  Widget build(BuildContext context);
}
