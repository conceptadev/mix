import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'divider.style.dart';
import '../../utils/component_recipe.dart';

class RemixDivider extends StatelessWidget
    implements RemixComponentRecipe<RemixDividerStyle> {
  const RemixDivider({
    super.key,
    this.style,
    this.variants = const [],
  });

  @override
  final RemixDividerStyle? style;

  @override
  final List<Variant> variants;

  RemixDividerStyle buildStyle(List<Variant> variants) {
    var styles = style == null ? RemixDividerStyle.base() : style!;
    return styles.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      style: buildStyle(variants).container,
    );
  }
}
