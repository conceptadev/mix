import '../base_attribute.dart';

class LetterSpacingUtility {
  const LetterSpacingUtility();
  LetterSpacingAttribute call(double letterSpacing) =>
      LetterSpacingAttribute(letterSpacing);
}

class LetterSpacingAttribute extends TextMixAttribute<double> {
  const LetterSpacingAttribute(this.letterSpacing);
  final double letterSpacing;
  @override
  double get value => letterSpacing;
}
