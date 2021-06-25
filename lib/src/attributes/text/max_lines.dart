import '../base_attribute.dart';

class MaxLinesUtility {
  MaxLinesAttribute call(int maxLines) => MaxLinesAttribute(maxLines);
}

class MaxLinesAttribute extends TextTypeAttribute<int> {
  const MaxLinesAttribute(this.maxLines);
  final int maxLines;

  int get value => maxLines;
}
