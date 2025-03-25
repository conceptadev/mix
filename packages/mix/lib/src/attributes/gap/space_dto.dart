import 'package:mix_annotations/mix_annotations.dart';

import '../../core/element.dart';
import '../../core/factory/mix_data.dart';

part 'space_dto.g.dart';

@Deprecated('Use SpaceDto instead')
typedef SpacingSideDto = SpaceMix;

@MixableProperty(components: GeneratedPropertyComponents.none)
class SpaceMix extends Mixable<double> with _$SpaceMix {
  final double? value;
  @MixableConstructor()
  const SpaceMix._({this.value});
  const SpaceMix(this.value);

  @override
  double resolve(MixData mix) {
    return mix.tokens.spaceTokenRef(value ?? 0);
  }
}
