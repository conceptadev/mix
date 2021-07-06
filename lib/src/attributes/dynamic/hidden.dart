import '../base_attribute.dart';

class HideUtility {
  const HideUtility();

  HiddenAttribute call([bool hide = true]) => HiddenAttribute(hide);
}

/// Hide attribute
class HiddenAttribute extends Attribute<bool> {
  const HiddenAttribute([this.hide = true]);
  final bool hide;
  @override
  bool get value {
    return hide;
  }
}
