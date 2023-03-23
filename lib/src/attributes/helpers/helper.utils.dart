import '../../mixer/mix_factory.dart';
import '../nested_attribute.dart';

class HelperUtility {
  const HelperUtility._();

  static NestedMixAttribute apply(List<MixFactory> mixes) {
    return NestedMixAttribute(MixFactory.combine(mixes));
  }
}

typedef FunctionWithListParam<T, R> = R Function(List<T> params);

class WrapFunction<T, R> {
  const WrapFunction(this.fn);

  final FunctionWithListParam<T, R> fn;

  // ignore: long-parameter-list
  R call([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params = <T>[];
    for (final param in [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) {
      if (param != null) params.add(param);
    }

    return fn(params);
  }
}
