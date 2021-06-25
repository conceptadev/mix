import '../base_attribute.dart';

class TextHeightUtility {
  TextHeightAttribute call(double textHeight) =>
      TextHeightAttribute(textHeight);
}

class TextHeightAttribute extends TextTypeAttribute<double> {
  const TextHeightAttribute(this.textHeight);
  final double textHeight;

  double get value => textHeight;
}
