import 'package:mix/src/attributes/attribute.dart';

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
