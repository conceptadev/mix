import '../variants/variant.dart';

abstract class StyleGroup<T extends StyleGroup<T>> {
  const StyleGroup();

  StyleGroup<T> merge(covariant StyleGroup<T>? other);

  StyleGroup<T> selectVariants(List<StyleVariant> variants);

  StyleGroup<T> copyWith();
}
