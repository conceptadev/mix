import 'package:mix/mix.dart';

class RadioState extends Variant {
  const RadioState._(String name) : super(name);

  static const active = RadioState._('remix.radio.active');
  static const inactive = RadioState._('remix.radio.inactive');
}
