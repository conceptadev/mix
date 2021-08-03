import '../base_attribute.dart';

class FontFamilyUtility {
  const FontFamilyUtility();
  FontFamilyAttribute call(String fontFamily) =>
      FontFamilyAttribute(fontFamily);
}

class FontFamilyAttribute extends TextMixAttribute<String> {
  const FontFamilyAttribute(this.fontFamily);
  final String fontFamily;
  @override
  String get value => fontFamily;
}
