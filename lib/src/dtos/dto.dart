import '../factory/mix_provider_data.dart';
import '../helpers/equality_mixin/equality_mixin.dart';

abstract class Dto<T> with CompareMixin {
  const Dto();

  T resolve(MixData mix);
}
