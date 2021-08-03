import 'package:mix/src/attributes/base_attribute.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class WithMixUtility {
  const WithMixUtility();
  WithMixAttribute call([
    Mix? mix1,
    Mix? mix2,
    Mix? mix3,
    Mix? mix4,
    Mix? mix5,
    Mix? mix6,
    Mix? mix7,
    Mix? mix8,
    Mix? mix9,
    Mix? mix10,
    Mix? mix11,
    Mix? mix12,
  ]) =>
      WithMixAttribute(
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
}

class WithMixAttribute extends Attribute<List<Attribute>> {
  WithMixAttribute([
    Mix? mix1,
    Mix? mix2,
    Mix? mix3,
    Mix? mix4,
    Mix? mix5,
    Mix? mix6,
    Mix? mix7,
    Mix? mix8,
    Mix? mix9,
    Mix? mix10,
    Mix? mix11,
    Mix? mix12,
  ]) {
    _mix = Mix.combine(
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
  }

  late Mix _mix;

  @override
  List<Attribute> get value => _mix.params;
}
