import '../base_attribute.dart';

class FontSizeUtility {
  FontSizeAttribute call(double fontSize) => FontSizeAttribute(fontSize);
}

class FontSizeAttribute extends TextTypeAttribute<double> {
  const FontSizeAttribute(this.fontSize);
  final double fontSize;

  double get value => fontSize;
}
