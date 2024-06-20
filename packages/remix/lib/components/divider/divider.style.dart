import 'package:mix/mix.dart';

class RemixDividerStyle extends StyleRecipe<RemixDividerStyle> {
  const RemixDividerStyle({
    this.container = const Style.empty(),
  });

  final Style container;

  factory RemixDividerStyle.base() {
    return RemixDividerStyle(
      container: _container(),
    );
  }

  @override
  RemixDividerStyle applyVariants(List<Variant> variants) {
    return RemixDividerStyle(
      container: container.applyVariants(variants),
    );
  }

  @override
  RemixDividerStyle copyWith({
    Style? container,
  }) {
    return RemixDividerStyle(
      container: this.container.merge(container),
    );
  }

  @override
  RemixDividerStyle merge(RemixDividerStyle? other) {
    return copyWith(
      container: other?.container,
    );
  }
}

Style _container() => Style(
      $box.margin.vertical(15),
      $box.height(2),
      $box.borderRadius(1),
      $box.color.grey.shade200(),
    );
