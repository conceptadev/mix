import 'package:mix/mix.dart';

class CheckboxState extends Variant {
  const CheckboxState._(String name) : super(name);

  static const checked = CheckboxState._('remix.checkbox.checked');
  static const unchecked = CheckboxState._('remix.checkbox.unchecked');
}
