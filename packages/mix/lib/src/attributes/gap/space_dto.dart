import 'package:mix_annotations/mix_annotations.dart';

import '../../core/element.dart';
import '../../core/factory/mix_data.dart';

part 'space_dto.g.dart';

@Deprecated('Use SpaceDto instead')
typedef SpacingSideDto = SpaceDto;

@MixableProperty(components: GeneratedPropertyComponents.none)
class SpaceDto extends StyleProperty<double> with _$SpaceDto {
  final double? value;
  @MixableConstructor()
  const SpaceDto._({this.value});
  const SpaceDto(this.value);

  @override
  double resolve(MixData mix) {
    return mix.tokens.spaceTokenRef(value ?? 0);
  }
}
