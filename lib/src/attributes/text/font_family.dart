import '../base_attribute.dart';

class FontFamilyUtility {
  FontFamilyAttribute call(String fontFamily) =>
      FontFamilyAttribute(fontFamily);
}

class FontFamilyAttribute extends TextTypeAttribute<String> {
  const FontFamilyAttribute(this.fontFamily);
  final String fontFamily;

  String get value => fontFamily;
}
