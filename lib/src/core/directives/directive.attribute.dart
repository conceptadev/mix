import '../../helpers/compare_mixin/compare_mixin.dart';

abstract class Directive<T> with Comparable {
  const Directive();
  T modify(covariant T value);

  @override
  get props => [modify];
}
