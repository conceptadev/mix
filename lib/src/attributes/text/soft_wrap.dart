import '../base_attribute.dart';

class SoftWrapUtility {
  const SoftWrapUtility();
  // ignore: avoid_positional_boolean_parameters
  SoftWrapAttribute call(bool softWrap) => SoftWrapAttribute(softWrap);
}

class SoftWrapAttribute extends TextMixAttribute<bool> {
  // ignore: avoid_positional_boolean_parameters
  const SoftWrapAttribute(this.softWrap);
  final bool softWrap;
  @override
  bool get value => softWrap;
}
