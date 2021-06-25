import '../base_attribute.dart';

class SoftWrapUtility {
  // ignore: avoid_positional_boolean_parameters
  SoftWrapAttribute call(bool softWrap) => SoftWrapAttribute(softWrap);
}

class SoftWrapAttribute extends TextTypeAttribute<bool> {
  // ignore: avoid_positional_boolean_parameters
  const SoftWrapAttribute(this.softWrap);
  final bool softWrap;

  bool get value => softWrap;
}
