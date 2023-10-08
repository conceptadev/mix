import 'dart:math';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

class ListAtttribute<Attr extends StyleAttribute>
    extends StyleAttribute<List<Attr>> {
  final List<Attr> _items;

  const ListAtttribute(List<Attr> items) : _items = items;

  static ListAtttribute<Attr>? maybeFrom<Attr extends StyleAttribute>(
    Iterable<Attr>? items,
  ) {
    return items == null ? null : ListAtttribute(items.toList());
  }

  @override
  List<Attr> resolve(MixData mix) {
    // Resolves individual attributes in the list and returns a list of resolved attributes
    return _items;
  }

  @override
  ListAtttribute<Attr> merge(ListAtttribute<Attr>? other) {
    if (other == null) return this;

    final list = _items;
    final otherList = other._items;

    if (list.isEmpty) return other;

    final listLength = list.length;
    final otherLength = otherList.length;
    final maxLength = max(listLength, otherLength);

    final mergedList = List<Attr>.generate(maxLength, (int index) {
      if (index < listLength && index < otherLength) {
        return list[index].merge(otherList[index]);
      } else if (index < listLength) {
        return list[index];
      }

      return otherList[index];
    });

    return ListAtttribute<Attr>(mergedList);
  }

  @override
  get props => [_items];
}
