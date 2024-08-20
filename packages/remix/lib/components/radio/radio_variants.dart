part of 'radio.dart';

abstract interface class IRadioVariant extends RemixVariant {
  const IRadioVariant(String name) : super('radio.$name');
}

class RadioStatus extends IRadioVariant {
  static const checked = RadioStatus('checked');
  static const unchecked = RadioStatus('unchecked');
  const RadioStatus(String name) : super('status.$name');
}

class RadioVariant extends IRadioVariant {
  static const solid = RadioVariant('solid');
  static const soft = RadioVariant('soft');
  static const surface = RadioVariant('surface');
  static const outline = RadioVariant('outline');

  const RadioVariant(String name) : super('variant.$name');

  static List<RadioVariant> get values => [solid, soft, surface, outline];
}

class RadioSize extends IRadioVariant {
  static const small = RadioSize('small');
  static const medium = RadioSize('medium');
  static const large = RadioSize('large');

  const RadioSize(String name) : super('size.$name');

  static List<RadioSize> get values => [small, medium, large];
}
