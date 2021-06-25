import '../base_attribute.dart';

class WordSpacingUtility {
  WordSpacingAttribute call(double wordSpacing) =>
      WordSpacingAttribute(wordSpacing);
}

class WordSpacingAttribute extends TextTypeAttribute<double> {
  const WordSpacingAttribute(this.wordSpacing);
  final double wordSpacing;

  double get value => wordSpacing;
}
