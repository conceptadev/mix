import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/alert/alert.style.dart';

import '../../helpers/widget_builder.dart';
import '../../utils/component_recipe.dart';

class RemixAlert extends StatelessWidget
    implements RemixComponentRecipe<RemixAlertStyle> {
  const RemixAlert({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
    this.style,
    this.variants = const [],
    this.leadingBuilder,
    this.titleBuilder,
    this.subtitleBuilder,
  });

  final IconData? icon;
  final String? title;
  final String? subtitle;

  final RemixWidgetBuilder<RemixAlertStyle>? leadingBuilder;
  final RemixWidgetBuilder<RemixAlertStyle>? titleBuilder;
  final RemixWidgetBuilder<RemixAlertStyle>? subtitleBuilder;

  @override
  final RemixAlertStyle? style;

  @override
  final List<Variant> variants;

  RemixAlertStyle buildStyle(List<Variant> variants) {
    final result = style == null ? RemixAlertStyle.base() : style!;
    return result.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final style = buildStyle(variants);

    final leadingWidget = leadingBuilder != null
        ? leadingBuilder!(style)
        : icon != null
            ? StyledIcon(icon, style: style.icon)
            : null;

    final titleWidget = titleBuilder != null
        ? titleBuilder!(style)
        : title != null
            ? StyledText(
                title!,
                style: style.title,
                inherit: false,
              )
            : null;

    final subtitleWidget = subtitleBuilder != null
        ? subtitleBuilder!(style)
        : subtitle != null
            ? StyledText(
                subtitle!,
                style: style.subtitle,
                inherit: false,
              )
            : null;

    return HBox(
      style: style.outerRowContainer,
      children: [
        if (leadingWidget != null) leadingWidget,
        VBox(
          style: style.innerColumnContainer,
          children: [
            if (titleWidget != null) titleWidget,
            if (subtitleWidget != null) subtitleWidget,
          ],
        ),
      ],
    );
  }
}
