import '../../../../mix.dart';
import '../../base_attribute.dart';

class FocusedUtility {
  const FocusedUtility();
  FocusedAttribute call(Mix mix) => FocusedAttribute(mix);
}

class FocusedAttribute extends Attribute<Mix> {
  const FocusedAttribute(this.mix);

  final Mix mix;

  @override
  Mix get value => mix;
}
