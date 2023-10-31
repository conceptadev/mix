import 'dart:math';

import '../attributes/wrapped_attribute.dart';
import '../core/attribute.dart';
import '../factory/style_mix.dart';

@Deprecated('Use style.merge(otherStyle), instead')
class HelperUtility {
  const HelperUtility._();

  @Deprecated('Use style.merge(otherStyle), instead')
  static WrappedStyleAttribute apply(List<StyleMix> mixes) {
    return WrappedStyleAttribute(StyleMix.combine(mixes));
  }
}

typedef FunctionWithListParam<ParamType, ReturnType> = ReturnType Function(
  List<ParamType> params,
);

typedef FunctionWithMapParam<ParamType extends Map<String, dynamic>, ReturnType>
    = ReturnType Function(ParamType params);

class SpreadNamedParams<ParamType extends Map<String, dynamic>, ReturnType> {
  final FunctionWithMapParam<ParamType, ReturnType> _function;
  final Map<String, dynamic> _initialParams;

  const SpreadNamedParams(this._function, {ParamType? initialParams})
      : _initialParams = initialParams ?? const {};
}

class SpreadPositionalParams<ParamType, ReturnType> {
  final FunctionWithListParam<ParamType, ReturnType> fn;

  const SpreadPositionalParams(this.fn);

// Ignore needed for API design.
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

double? doubleNullIfZero(double? value) {
  if (value == null || value == 0.0) return null;

  return value;
}

List<M> mergeMergeableList<M extends Mergeable>(
  List<M>? current,
  List<M>? other,
) {
  if (current == null && other == null) return [];
  if (current == null) return other ?? [];
  if (other == null) return current;

  if (current.isEmpty) return other;

  final listLength = current.length;
  final otherLength = other.length;
  final maxLength = max(listLength, otherLength);

  return List<M>.generate(maxLength, (int index) {
    if (index < listLength && index < otherLength) {
      return mergeAttribute(current[index], other[index]);
    } else if (index < listLength) {
      return current[index];
    }

    return other[index];
  });
}

@override
M mergeAttribute<M extends Mergeable>(M? current, M? other) {
  return current?.merge(other) ?? other;
}
