import 'package:mix/mix.dart';

class RemixAvatarStyle extends StyleRecipe<RemixAvatarStyle> {
  const RemixAvatarStyle({
    this.container = const Style.empty(),
    this.fallbackLabel = const Style.empty(),
    this.image = const Style.empty(),
  });

  final Style container;
  final Style fallbackLabel;
  final Style image;

  factory RemixAvatarStyle.base() {
    return RemixAvatarStyle(
      container: _container(),
      fallbackLabel: _label(),
      image: _image(),
    );
  }

  @override
  RemixAvatarStyle applyVariants(List<Variant> variants) {
    return RemixAvatarStyle(
      container: container.applyVariants(variants),
      fallbackLabel: fallbackLabel.applyVariants(variants),
      image: image.applyVariants(variants),
    );
  }

  @override
  RemixAvatarStyle copyWith({
    Style? container,
    Style? fallbackLabel,
    Style? image,
  }) {
    return RemixAvatarStyle(
      container: this.container.merge(container),
      fallbackLabel: this.fallbackLabel.merge(fallbackLabel),
      image: this.image.merge(image),
    );
  }

  @override
  RemixAvatarStyle merge(RemixAvatarStyle? other) {
    return copyWith(
      container: other?.container,
      fallbackLabel: other?.fallbackLabel,
      image: other?.image,
    );
  }
}

Style _container() => Style(
      $box.color.grey.shade100(),
      $box.borderRadius(50),
      $box.alignment.center(),
      $box.width(40),
      $box.height(40),
      $box.clipBehavior.antiAlias(),
      $with.clipOval(),
    );

Style _label() => Style(
      $text.style.fontSize(16),
      $text.style.color.black54(),
      $text.style.fontWeight.bold(),
    );

Style _image() => Style(
      $image.fit.cover(),
    );
