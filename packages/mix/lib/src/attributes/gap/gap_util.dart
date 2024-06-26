import '../../core/attribute.dart';
import '../../core/utility.dart';
import '../../theme/tokens/space_token.dart';
import 'gap_dto.dart';

final class GapUtility<T extends Attribute> extends MixUtility<T, GapDto> {
  const GapUtility(super.builder);

  T call(double value) => builder(GapDto(value));

  T ref(SpaceToken ref) => builder(GapDto(ref()));
}
