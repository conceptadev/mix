import '../../../../mix.dart';
import '../../base_attribute.dart';

class HoveringUtility {
  const HoveringUtility();
  HoveringAttribute call(Mix mix) => HoveringAttribute(mix);
}

class HoveringAttribute extends Attribute<Mix> {
  const HoveringAttribute(this.mix);

  final Mix mix;

  @override
  Mix get value => mix;
}
