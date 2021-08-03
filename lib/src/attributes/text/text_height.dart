import '../base_attribute.dart';

class TextHeightUtility {
  const TextHeightUtility();
  TextHeightAttribute call(double textHeight) =>
      TextHeightAttribute(textHeight);
}

class TextHeightAttribute extends TextMixAttribute<double> {
  const TextHeightAttribute(this.textHeight);
  final double textHeight;
  @override
  double get value => textHeight;
}
