import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../../helpers/widget_builder.dart';
import 'list_tile.style.dart';
import '../../utils/component_recipe.dart';

class RemixListTile extends StatelessWidget
    implements RemixComponentRecipe<RemixListTileStyle> {
  const RemixListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.style,
    this.variants = const [],
    this.titleBuilder,
    this.subtitleBuilder,
  });

  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;

  final RemixWidgetBuilder<RemixListTileStyle>? titleBuilder;
  final RemixWidgetBuilder<RemixListTileStyle>? subtitleBuilder;

  @override
  final RemixListTileStyle? style;

  @override
  final List<Variant> variants;

  RemixListTileStyle buildStyle(List<Variant> variants) {
    var styles = style == null ? RemixListTileStyle.base() : style!;
    return styles.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final style = buildStyle(variants);

    final titleWidget = titleBuilder != null
        ? titleBuilder!(style)
        : title != null
            ? StyledText(title!, style: style.title)
            : null;

    final subtitleWidget = subtitleBuilder != null
        ? subtitleBuilder!(style)
        : subtitle != null
            ? StyledText(subtitle!, style: style.subtitle)
            : null;

    return HBox(
      style: style.outerRowContainer,
      children: [
        if (leading != null) leading!,
        VBox(
          style: style.innerColumnContainer,
          children: [
            if (titleWidget != null) titleWidget,
            if (subtitleWidget != null) subtitleWidget,
          ],
        ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
