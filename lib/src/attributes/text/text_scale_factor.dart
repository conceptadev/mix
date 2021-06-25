import '../base_attribute.dart';

class TextScaleFactorUtility {
  TextScaleFactorAttribute call(double textScaleFactor) =>
      TextScaleFactorAttribute(textScaleFactor);
}

class TextScaleFactorAttribute extends TextTypeAttribute<double> {
  const TextScaleFactorAttribute(this.textScaleFactor);
  final double textScaleFactor;

  double get value => textScaleFactor;
}
