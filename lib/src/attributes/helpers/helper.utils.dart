import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class HelpersUtility {
  const HelpersUtility._();
  static NestedMixAttributes<T> apply<T extends Attribute>([
    Mix<T>? mix1,
    Mix<T>? mix2,
    Mix<T>? mix3,
    Mix<T>? mix4,
    Mix<T>? mix5,
    Mix<T>? mix6,
    Mix<T>? mix7,
    Mix<T>? mix8,
    Mix<T>? mix9,
    Mix<T>? mix10,
    Mix<T>? mix11,
    Mix<T>? mix12,
  ]) {
    final mix = Mix.combine<T>(
      mix1,
      mix2,
      mix3,
      mix4,
      mix5,
      mix6,
      mix7,
      mix8,
      mix9,
      mix10,
      mix11,
      mix12,
    );
    return NestedMixAttributes<T>(mix);
  }
}
