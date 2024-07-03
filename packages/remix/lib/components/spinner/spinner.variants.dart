import 'package:mix/mix.dart';

interface class ISpinnerVariant extends Variant {
  const ISpinnerVariant(super.name);
}

class SpinnerSize extends ISpinnerVariant {
  const SpinnerSize(super.name);

  static const xsmall = SpinnerSize('remix.spinner.xsmall');
  static const small = SpinnerSize('remix.spinner.small');
  static const medium = SpinnerSize('remix.spinner.medium');
  static const large = SpinnerSize('remix.spinner.large');

  static List<SpinnerSize> get values => [xsmall, small, medium, large];
}
