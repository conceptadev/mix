import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/box/box.attributes.dart';
import 'package:mix/src/attributes/primitives/text/text_attributes.dart';
import 'package:mix/src/attributes/primitives/widget_attributes.dart';

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

  WidgetAttributes get attributes => recipe.widgetProps.build();
  BoxAttributes get boxAttributes => recipe.boxProps.build();
  TextAttributes get textAttributes => recipe.textProps.build();

  final Recipe recipe;

  @override
  Widget build(BuildContext context);
}
