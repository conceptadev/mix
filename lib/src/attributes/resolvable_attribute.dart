import '../factory/mix_provider_data.dart';
import 'attribute.dart';
import 'helpers/list.attribute.dart';

abstract class ResolvableAttribute<T> extends Attribute with Resolvable<T> {
  const ResolvableAttribute({super.key});
}

abstract class ResolvableDto<T> extends Dto with Mergeable, Resolvable<T> {
  const ResolvableDto();
}

extension ListResolvableAttributeExt<T> on List<ResolvableAttribute<T>> {
  List<T> resolveAll(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }

  // .list, gets a List of T and turns into a ListAttribute<ResolvableAttribute<T>>
  ListAtttribute<ResolvableAttribute<T>> get list =>
      ListAtttribute<ResolvableAttribute<T>>(this);
}
