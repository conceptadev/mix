import '../../core/element.dart';
import '../../core/utility.dart';
import '../../theme/tokens/space_token.dart';
import 'spacing_side_dto.dart';

final class GapUtility<T extends Attribute> extends MixUtility<T, SpaceDto> {
  const GapUtility(super.builder);

  T call(double value) => builder(SpaceDto(value));

  T ref(SpaceToken ref) => builder(SpaceDto(ref()));
}
