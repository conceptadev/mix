import '../base_attribute.dart';

class HideUtility {
  // ignore: avoid_positional_boolean_parameters
  HiddenAttribute call([bool hide = true]) => HiddenAttribute(hide);
}

/// Hide attribute
class HiddenAttribute extends Attribute<bool> {
  // ignore: avoid_positional_boolean_parameters
  const HiddenAttribute([this.hide = true]);
  final bool hide;

  bool get value {
    return hide;
  }
}
