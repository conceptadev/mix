import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_factory.dart';

class HelperUtils {
  const HelperUtils._();

  static NestedAttribute<T> apply<T extends Attribute>(List<Mix<T>> mixes) {
    final combinedMix = Mix<T>();
    for (var mix in mixes) {
      combinedMix.addAll(mix.attributes);
    }

    return NestedAttribute<T>(combinedMix.attributes);
  }
}

typedef AttributesParamFn<T extends Attribute, R> = R Function(
    List<T> attributes);

typedef PositionalParamFn<T, R> = R Function([
  T? p1,
  T? p2,
  T? p3,
  T? p4,
  T? p5,
  T? p6,
]);

class WrapFunction<T extends Attribute, R> {
  const WrapFunction._(this.fn);
  final AttributesParamFn<T, R> fn;

  static PositionalParamFn<T, R> withPositionalParams<T extends Attribute, R>(
      AttributesParamFn<T, R> fn) {
    return WrapFunction<T, R>._(fn).withAttributeParams;
  }

  _spreadNestedMix(List<T> attributes) {
    final spreaded = [...attributes];
    for (final attr in attributes) {
      if (attr is NestedAttribute<T>) {
        spreaded.addAll(attr.attributes);
      } else {
        spreaded.add(attr);
      }
    }

    return spreaded;
  }

  /// Attribute params to list
  R withAttributeParams([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
  ]) {
    final attributes = <T>[];

    if (p1 != null) {
      attributes.add(p1);
    }
    if (p2 != null) {
      attributes.add(p2);
    }
    if (p3 != null) {
      attributes.add(p3);
    }
    if (p4 != null) {
      attributes.add(p4);
    }
    if (p5 != null) {
      attributes.add(p5);
    }
    if (p6 != null) {
      attributes.add(p6);
    }

    return fn(_spreadNestedMix(attributes));
  }
}

// /// Attribute params to list
// List<T> withAttributeParams<T>([
//   T? p1,
//   T? p2,
//   T? p3,
//   T? p4,
//   T? p5,
//   T? p6,
// ]) {
//   final attributes = <T>[];

//   if (p1 != null) {
//     attributes.add(p1);
//   }
//   if (p2 != null) {
//     attributes.add(p2);
//   }
//   if (p3 != null) {
//     attributes.add(p3);
//   }
//   if (p4 != null) {
//     attributes.add(p4);
//   }
//   if (p5 != null) {
//     attributes.add(p5);
//   }
//   if (p6 != null) {
//     attributes.add(p6);
//   }

//   return attributes;
// }
