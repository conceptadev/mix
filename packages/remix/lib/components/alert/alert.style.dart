import 'package:mix/mix.dart';

class RemixAlertStyle extends StyleRecipe<RemixAlertStyle> {
  const RemixAlertStyle({
    this.outerRowContainer = const Style.empty(),
    this.innerColumnContainer = const Style.empty(),
    this.title = const Style.empty(),
    this.subtitle = const Style.empty(),
    this.icon = const Style.empty(),
  });

  final Style outerRowContainer;
  final Style innerColumnContainer;
  final Style title;
  final Style subtitle;
  final Style icon;

  factory RemixAlertStyle.base() {
    return RemixAlertStyle(
      outerRowContainer: _outerRowContainer(),
      innerColumnContainer: _innerColumnContainer(),
      title: _title(),
      subtitle: _subtitle(),
      icon: _icon(),
    );
  }

  @override
  RemixAlertStyle applyVariants(List<Variant> variants) {
    return RemixAlertStyle(
      outerRowContainer: outerRowContainer.applyVariants(variants),
      innerColumnContainer: innerColumnContainer.applyVariants(variants),
      title: title.applyVariants(variants),
      subtitle: subtitle.applyVariants(variants),
      icon: icon.applyVariants(variants),
    );
  }

  @override
  RemixAlertStyle merge(RemixAlertStyle? other) {
    if (other == null) return this;
    return copyWith(
      outerRowContainer: outerRowContainer.merge(other.outerRowContainer),
      innerColumnContainer:
          innerColumnContainer.merge(other.innerColumnContainer),
      title: title.merge(other.title),
      subtitle: subtitle.merge(other.subtitle),
      icon: icon.merge(other.icon),
    );
  }

  @override
  RemixAlertStyle copyWith({
    Style? outerRowContainer,
    Style? innerColumnContainer,
    Style? title,
    Style? subtitle,
    Style? icon,
  }) {
    return RemixAlertStyle(
      outerRowContainer: outerRowContainer ?? this.outerRowContainer,
      innerColumnContainer: innerColumnContainer ?? this.innerColumnContainer,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
    );
  }
}

Style _outerRowContainer() => Style(
      $flex.gap(8),
      $box.padding(16),
      $box.borderRadius(8),
      $box.border.width(1),
      $box.border.color.redAccent(),
      $flex.mainAxisSize.min(),
      $flex.mainAxisAlignment.start(),
      $flex.crossAxisAlignment.start(),
    );

Style _innerColumnContainer() => Style(
      $flex.gap(2),
      $flex.mainAxisSize.min(),
      $flex.mainAxisAlignment.start(),
      $flex.crossAxisAlignment.start(),
      flexible.expanded(),
    );

Style _title() => Style(
      $text.style.fontSize(14),
      $text.style.fontWeight.w600(),
      $text.style.color.redAccent(),
    );

Style _subtitle() => Style(
      $text.style.fontSize(14),
      $text.style.fontWeight.normal(),
      $text.style.color.redAccent(),
    );

Style _icon() => Style(
      $icon.size(20),
      $icon.color.redAccent(),
    );
