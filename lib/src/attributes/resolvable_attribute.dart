import 'attribute.dart';

abstract class ResolvableAttribute<T> extends Attribute
    with Mergeable, Resolvable<T> {
  const ResolvableAttribute({super.key});
}

abstract class ResolvableDto<T> extends Dto with Mergeable, Resolvable<T> {
  const ResolvableDto();
}
