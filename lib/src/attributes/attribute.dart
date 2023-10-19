import '../factory/exports.dart';
import '../helpers/compare_mixin/compare_mixin.dart';

abstract class Dto<T> with Comparable, Mergeable, Resolvable<T> {
  const Dto();
}

/// Base attribute.
// Some classes have defaults.
// Facade allows us ot set all properties as optional.
// For improved merge and override of properties.
abstract class Attribute<T> with Comparable, Mergeable {
  const Attribute();

  /// The extension's type.
  // ignore: no-object-declaration
  Object get type => T;
}

mixin Resolvable<T> {
  T resolve(MixData mix);
}

mixin Mergeable<T> {
  T merge(covariant T? other);

  M mergeProp<M extends Mergeable>(M? current, M? other) {
    return current?.merge(other) ?? other;
  }
}
