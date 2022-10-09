import 'package:mix/src/attributes/attribute.dart';

/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  const NestedAttribute(this.attributes);

  final List<T> attributes;
}
