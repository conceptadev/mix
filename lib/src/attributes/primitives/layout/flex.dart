import '../../base_attribute.dart';

class FlexUtility {
  const FlexUtility();
  FlexAttribute call([int flex = 1]) => FlexAttribute(flex);
}

class FlexAttribute extends Attribute<int> {
  const FlexAttribute([this.flex = 1]);

  final int flex;
  @override
  int get value => flex;
}
