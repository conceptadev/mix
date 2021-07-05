import '../base_attribute.dart';

class FontSizeUtility {
  const FontSizeUtility();
  FontSizeAttribute call(double fontSize) => FontSizeAttribute(fontSize);
}

class FontSizeAttribute extends TextTypeAttribute<double> {
  const FontSizeAttribute(this.fontSize);
  final double fontSize;
  @override
  double get value => fontSize;
}
