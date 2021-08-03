import 'package:example/remix/components/atoms/button/button.mix.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RawRemixButton extends StatelessWidget {
  const RawRemixButton({
    required this.label,
    required this.onPressed,
    this.icon,
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final IconData? icon;
  final RawRemixButtonRecipe recipe;

  List<Widget> _renderChildren() {
    final _icon = icon;
    final widgets = <Widget>[];
    if (_icon != null) {
      widgets.add(
        IconMix(
          recipe.icon,
          icon: _icon,
        ),
      );
    }
    widgets.add(
      TextMix(
        recipe.label,
        text: label,
      ),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext ctx) {
    return InkWell(
      onTap: onPressed,
      child: RowBox(
        recipe.container,
        children: _renderChildren(),
      ),
    );
  }
}

class RemixButton extends StatelessWidget {
  const RemixButton({
    required this.label,
    required this.onPressed,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawRemixButton(
      label: label,
      icon: icon,
      onPressed: onPressed,
      recipe: ButtonRecipe(),
    );
  }
}

class RemixOutlinedButton extends StatelessWidget {
  const RemixOutlinedButton({
    required this.label,
    required this.onPressed,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawRemixButton(
      label: label,
      icon: icon,
      onPressed: onPressed,
      recipe: OutlinedButtonRecipe(),
    );
  }
}

class RemixTextButton extends StatelessWidget {
  const RemixTextButton({
    required this.label,
    required this.onPressed,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawRemixButton(
      label: label,
      icon: icon,
      onPressed: onPressed,
      recipe: TextButtonrecipe(),
    );
  }
}
