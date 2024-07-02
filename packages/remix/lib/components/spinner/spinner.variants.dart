import 'package:mix/mix.dart';

class SpinnerVariant extends Variant {
  const SpinnerVariant(super.name);
}

class SpinnerSize extends SpinnerVariant {
  const SpinnerSize(super.name);

  static const xsmall = SpinnerSize('remix.spinner.xsmall');
  static const small = SpinnerSize('remix.spinner.small');
  static const medium = SpinnerSize('remix.spinner.medium');
  static const large = SpinnerSize('remix.spinner.large');

  static List<SpinnerSize> get values => [xsmall, small, medium, large];
}
