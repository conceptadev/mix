import '../core/equality/compare_mixin.dart';

/// The `Directive` abstract class provides a mechanism to modify a value of type `T`.
/// It is typically used in the context of an `Attribute`.
abstract class Directive<T> with Comparable {
  const Directive();

  // An abstract method modify that takes a covariant parameter of type T
  // This method is used to modify the value of type T
  // The implementation of this method will be provided by the subclasses of Directive
  T modify(covariant T value);
}
