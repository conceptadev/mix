import 'package:mix/mix.dart';

class RemixListTileStyle extends StyleRecipe<RemixListTileStyle> {
  const RemixListTileStyle({
    this.outerRowContainer = const Style.empty(),
    this.innerColumnContainer = const Style.empty(),
    this.title = const Style.empty(),
    this.subtitle = const Style.empty(),
  });

  final Style outerRowContainer;
  final Style innerColumnContainer;
  final Style title;
  final Style subtitle;

  factory RemixListTileStyle.base() {
    return RemixListTileStyle(
      outerRowContainer: _outerRowContainer(),
      innerColumnContainer: _innerColumnContainer(),
      title: _title(),
      subtitle: _subtitle(),
    );
  }

  @override
  RemixListTileStyle applyVariants(List<Variant> variants) {
    return RemixListTileStyle(
      outerRowContainer: outerRowContainer.applyVariants(variants),
      innerColumnContainer: innerColumnContainer.applyVariants(variants),
      title: title.applyVariants(variants),
      subtitle: subtitle.applyVariants(variants),
    );
  }

  @override
  RemixListTileStyle copyWith({
    Style? outerRowContainer,
    Style? innerColumnContainer,
    Style? title,
    Style? subtitle,
  }) {
    return RemixListTileStyle(
      outerRowContainer: this.outerRowContainer.merge(outerRowContainer),
      innerColumnContainer:
          this.innerColumnContainer.merge(innerColumnContainer),
      title: this.title.merge(title),
      subtitle: this.subtitle.merge(subtitle),
    );
  }

  @override
  RemixListTileStyle merge(RemixListTileStyle? other) {
    return copyWith(
      outerRowContainer: other?.outerRowContainer,
      innerColumnContainer: other?.innerColumnContainer,
      title: other?.title,
      subtitle: other?.subtitle,
    );
  }
}

Style _outerRowContainer() => Style(
      $flex.gap(16),
    );

Style _innerColumnContainer() => Style(
      $flex.mainAxisAlignment.center(),
      $flex.mainAxisSize.min(),
      $flex.crossAxisAlignment.start(),
      $flex.gap(4),
    );

Style _title() => Style(
      $text.style.fontSize(14),
      $text.style.fontWeight.w600(),
      $text.style.color.black(),
    );

Style _subtitle() => Style(
      $text.style.fontSize(14),
      $text.style.fontWeight.normal(),
      $text.style.color.grey(),
      $text.maxLines(2),
    );
