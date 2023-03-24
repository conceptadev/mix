import '../../mixer/mix_factory.dart';
import '../nested_attribute.dart';

class HelperUtility {
  const HelperUtility._();

  static NestedMixAttribute apply(List<Mix> mixes) {
    return NestedMixAttribute(Mix.combine(mixes));
  }
}

typedef FunctionWithListParam<ParamType, ReturnType> = ReturnType Function(
  List<ParamType> params,
);

class SpreadFunctionParams<ParamType, ReturnType> {
  const SpreadFunctionParams(this.fn);

  final FunctionWithListParam<ParamType, ReturnType> fn;

  // ignore: long-parameter-list
  ReturnType call([
    ParamType? p1,
    ParamType? p2,
    ParamType? p3,
    ParamType? p4,
    ParamType? p5,
    ParamType? p6,
    ParamType? p7,
    ParamType? p8,
    ParamType? p9,
    ParamType? p10,
    ParamType? p11,
    ParamType? p12,
  ]) {
    final params = <ParamType>[];
    for (final param in [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) {
      if (param != null) params.add(param);
    }

    return fn(params);
  }
}
