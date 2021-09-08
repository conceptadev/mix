import '../../../../mix.dart';
import '../../base_attribute.dart';

class DisabledUtility {
  const DisabledUtility();
  DisabledAttribute call(Mix mix) => DisabledAttribute(mix);
}

class DisabledAttribute extends Attribute<Mix> {
  const DisabledAttribute(this.mix);

  final Mix mix;

  @override
  Mix get value => mix;
}
