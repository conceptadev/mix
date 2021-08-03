import '../base_attribute.dart';

class WordSpacingUtility {
  const WordSpacingUtility();
  WordSpacingAttribute call(double wordSpacing) =>
      WordSpacingAttribute(wordSpacing);
}

class WordSpacingAttribute extends TextMixAttribute<double> {
  const WordSpacingAttribute(this.wordSpacing);
  final double wordSpacing;
  @override
  double get value => wordSpacing;
}
