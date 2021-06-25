import '../base_attribute.dart';

class FlexUtility {
  FlexAttribute call([int flex = 1]) => FlexAttribute(flex);
}

class FlexAttribute extends Attribute<int> {
  const FlexAttribute([this.flex = 1]);

  final int flex;

  int get value => flex;
}
