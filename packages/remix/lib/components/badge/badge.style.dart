import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RemixBadgeStyle extends StyleRecipe<RemixBadgeStyle> {
  const RemixBadgeStyle({
    this.container = const Style.empty(),
    this.label = const Style.empty(),
  });

  final Style container;
  final Style label;

  factory RemixBadgeStyle.base() {
    return RemixBadgeStyle(
      container: _container(),
      label: _label(),
    );
  }

  @override
  RemixBadgeStyle applyVariants(List<Variant> variants) {
    return RemixBadgeStyle(
      container: container.applyVariants(variants),
      label: label.applyVariants(variants),
    );
  }

  @override
  RemixBadgeStyle copyWith({
    Style? container,
    Style? label,
  }) {
    return RemixBadgeStyle(
      container: this.container.merge(container),
      label: this.label.merge(label),
    );
  }

  @override
  RemixBadgeStyle merge(RemixBadgeStyle? other) {
    return copyWith(
      container: other?.container,
      label: other?.label,
    );
  }
}

Style _container() => Style(
      $flex.mainAxisAlignment.center(),
      $flex.mainAxisSize.min(),
      $flex.crossAxisAlignment.center(),
      $flex.gap(4),
      $box.padding.horizontal(10),
      $box.padding.vertical(2),
      $box.borderRadius(20),
      $box.color.black(),
    );

Style _label() => Style(
      $text.style.fontSize(12),
      $text.style.fontWeight.w600(),
      $text.style.color.white(),
    );
