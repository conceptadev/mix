import 'package:remix/helpers/variant.dart';

abstract interface class IRadioVariant extends RemixVariant {
  const IRadioVariant(String name) : super('radio.$name');
}

class RadioStatus extends IRadioVariant {
  const RadioStatus(String name) : super('status.$name');

  static const checked = RadioStatus('checked');
  static const unchecked = RadioStatus('unchecked');
}

class RadioVariant extends IRadioVariant {
  const RadioVariant(String name) : super('variant.$name');

  static const solid = RadioVariant('solid');
  static const soft = RadioVariant('soft');
  static const surface = RadioVariant('surface');
  static const outline = RadioVariant('outline');
  static const ghost = RadioVariant('ghost');

  static List<RadioVariant> get values => [
        solid,
        soft,
        surface,
        outline,
        ghost,
      ];
}

class RadioSize extends IRadioVariant {
  const RadioSize(String name) : super('size.$name');

  static const small = RadioSize('small');
  static const medium = RadioSize('medium');
  static const large = RadioSize('large');

  static List<RadioSize> get values => [small, medium, large];
}
