import 'package:remix/helpers/variant.dart';

interface class ISwitchVariant extends RemixVariant {
  const ISwitchVariant(String name) : super('switch.$name');
}

class SwitchStatus extends ISwitchVariant {
  const SwitchStatus(String name) : super('status.$name');

  static const on = SwitchStatus('on');
  static const off = SwitchStatus('off');

  static List<SwitchStatus> get values => [on, off];
}

class SwitchSize extends ISwitchVariant {
  const SwitchSize(String name) : super('size.$name');

  static const small = SwitchSize('small');
  static const medium = SwitchSize('medium');
  static const large = SwitchSize('large');

  static List<SwitchSize> get values => [small, medium, large];
}

class SwitchVariant extends ISwitchVariant {
  const SwitchVariant(String name) : super('variant.$name');

  static const solid = SwitchVariant('solid');
  static const soft = SwitchVariant('soft');
  static const surface = SwitchVariant('surface');
  static const outline = SwitchVariant('outline');

  static List<SwitchVariant> get values => [
        solid,
        soft,
        surface,
        outline,
      ];
}
