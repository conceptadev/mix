import '../attributes/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class ResolvableAttribute<T> extends Attribute {
  const ResolvableAttribute({super.key});

  T resolve(MixData mix);
}
