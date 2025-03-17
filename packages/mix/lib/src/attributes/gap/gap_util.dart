import '../../core/element.dart';
import '../../core/utility.dart';
import '../../theme/tokens/space_token.dart';
import 'spacing_side_dto.dart';

final class GapUtility<T extends Attribute>
    extends MixUtility<T, SpacingSideDto> {
  const GapUtility(super.builder);

  T call(double value) => builder(SpacingSideDto(value));

  T ref(SpaceToken ref) => builder(SpacingSideDto(ref()));
}
