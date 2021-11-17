import 'package:mix/src/attributes/common/attribute.dart';

class VariantAttribute extends Attribute {
  const VariantAttribute(
    this.variant,
    this.attributes,
  );

  final Symbol variant;
  final List<Attribute> attributes;
}
