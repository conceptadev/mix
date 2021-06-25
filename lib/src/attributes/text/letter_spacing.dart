import '../base_attribute.dart';

class LetterSpacingUtility {
  LetterSpacingAttribute call(double letterSpacing) =>
      LetterSpacingAttribute(letterSpacing);
}

class LetterSpacingAttribute extends TextTypeAttribute<double> {
  const LetterSpacingAttribute(this.letterSpacing);
  final double letterSpacing;

  double get value => letterSpacing;
}
