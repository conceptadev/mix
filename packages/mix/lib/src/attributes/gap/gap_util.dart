import '../../core/attribute.dart';
import '../../core/utility.dart';
import '../../theme/tokens/space_token.dart';
import 'spacing_side_dto.dart';

final class GapUtility<T extends Attribute>
    extends MixUtility<T, SpacingSideDto> {
  const GapUtility(super.build);

  T call(double value) => build(SpacingSideDto(value));

  T ref(SpaceToken ref) => build(SpacingSideDto(ref()));
}
