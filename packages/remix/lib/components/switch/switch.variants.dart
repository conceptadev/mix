import 'package:mix/mix.dart';

class SwitchState extends Variant {
  const SwitchState._(String name) : super(name);

  static const active = SwitchState._('remix.switch.active');
  static const inactive = SwitchState._('remix.switch.inactive');
}
