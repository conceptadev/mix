import '../factory/exports.dart';
import '../helpers/compare_mixin.dart';

abstract class Dto<R> with Comparable, Mergeable, Resolvable<R> {
  const Dto();
}

/// Base attribute.
// Some classes have defaults.
// Facade allows us ot set all properties as optional.
// For improved merge and override of properties.
abstract class Attribute with Comparable, Mergeable {
  const Attribute();
}

mixin Resolvable<T> {
  T resolve(MixData mix);
}

mixin Mergeable<T> {
  T merge(covariant T? other);

  M mergeAttr<M extends Mergeable>(M? current, M? other) {
    return current?.merge(other) ?? other;
  }
}
