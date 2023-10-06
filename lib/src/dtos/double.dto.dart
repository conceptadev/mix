import '../factory/mix_provider_data.dart';
import 'dto.dart';

typedef ValueModifier<T> = T Function(T value);

@Deprecated('Remove this for now')
class DoubleDto extends ResolvableAttribute<double> {
  final double _value;

  // Modifier is only used after value is resolved.
  final ValueModifier<double>? _modifier;

  const DoubleDto(double value, {ValueModifier<double>? directive})
      : _value = value,
        _modifier = directive;

  const DoubleDto.from(double value, {ValueModifier<double>? directiv})
      : _value = value,
        _modifier = null;

  static DoubleDto? maybeFrom(double? value) {
    if (value == null) return null;

    return DoubleDto(value);
  }

  @override
  DoubleDto merge(covariant DoubleDto? other) {
    if (other == null) return this;

    return DoubleDto(other._value, directive: other._modifier ?? _modifier);
  }

  @override
  double resolve(MixData mix) {
    final modifier = _modifier;

    return modifier == null ? _value : modifier(_value);
  }

  @override
  get props => [_value, _modifier];
}
