import '../factory/mix_provider_data.dart';
import '../helpers/equatable_mixin.dart';

abstract class Dto<T> with EquatableMixin {
  const Dto();

  T resolve(MixData mix);
}
