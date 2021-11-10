import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class ApplyUtility extends NestedAttributes {
  ApplyUtility._(Mix mix) : _mix = mix;

  final Mix _mix;

  static ApplyUtility fromMixes(
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
  ) {
    final mix = Mix.combine(
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
    return ApplyUtility._(mix);
  }

  @override
  get attributes => _mix.props;
}
