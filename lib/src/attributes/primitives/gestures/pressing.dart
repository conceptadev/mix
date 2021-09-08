import '../../../../mix.dart';
import '../../base_attribute.dart';

class PressingUtility {
  const PressingUtility();
  PressingAttribute call(Mix mix) => PressingAttribute(mix);
}

class PressingAttribute extends Attribute<Mix> {
  const PressingAttribute(this.mix);

  final Mix mix;

  @override
  Mix get value => mix;
}
