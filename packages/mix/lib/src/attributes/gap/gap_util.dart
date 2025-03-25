import '../../core/element.dart';
import '../../core/utility.dart';
import '../../theme/tokens/space_token.dart';
import 'space_dto.dart';

final class GapUtility<T extends Attribute> extends MixUtility<T, SpaceMix> {
  const GapUtility(super.builder);

  T call(double value) => builder(SpaceMix(value));

  T ref(SpaceToken ref) => builder(SpaceMix(ref()));
}
