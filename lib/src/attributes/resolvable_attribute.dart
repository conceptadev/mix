import 'attribute.dart';

abstract class ResolvableAttribute<T> extends Attribute with ResolveMixin<T> {
  const ResolvableAttribute({super.key});
}

abstract class ResolvableDto<T> extends Dto with ResolveMixin<T> {
  const ResolvableDto();
}
