import 'package:mix/mix.dart';

class RemixCardStyle extends StyleRecipe<RemixCardStyle> {
  const RemixCardStyle({
    this.container = const Style.empty(),
  });

  final Style container;

  factory RemixCardStyle.base() {
    return RemixCardStyle(
      container: _container(),
    );
  }

  @override
  RemixCardStyle applyVariants(List<Variant> variants) {
    return RemixCardStyle(
      container: container.applyVariants(variants),
    );
  }

  @override
  RemixCardStyle merge(RemixCardStyle? other) {
    if (other == null) return this;
    return copyWith(
      container: container.merge(other.container),
    );
  }

  @override
  RemixCardStyle copyWith({
    Style? container,
  }) {
    return RemixCardStyle(
      container: container ?? this.container,
    );
  }
}

Style _container() => Style(
      $box.padding(16),
      $box.elevation(1),
      $box.borderRadius(8),
      $box.color.white(),
    );
