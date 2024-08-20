part of 'spinner.dart';

interface class ISpinnerVariant extends RemixVariant {
  const ISpinnerVariant(String name) : super('spinner.$name');
}

class SpinnerSize extends ISpinnerVariant {
  static const small = SpinnerSize('small');
  static const medium = SpinnerSize('medium');
  static const large = SpinnerSize('large');

  const SpinnerSize(String name) : super('size.$name');

  static List<SpinnerSize> get values => [small, medium, large];
}

class SpinnerVariant extends ISpinnerVariant {
  static const solid = SpinnerVariant('solid');
  static const dotted = SpinnerVariant('dotted');

  const SpinnerVariant(String name) : super('variant.$name');

  static List<SpinnerVariant> get values => [dotted, solid];
}
