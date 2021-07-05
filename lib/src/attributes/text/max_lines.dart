import '../base_attribute.dart';

class MaxLinesUtility {
  const MaxLinesUtility();
  MaxLinesAttribute call(int maxLines) => MaxLinesAttribute(maxLines);
}

class MaxLinesAttribute extends TextTypeAttribute<int> {
  const MaxLinesAttribute(this.maxLines);
  final int maxLines;
  @override
  int get value => maxLines;
}
