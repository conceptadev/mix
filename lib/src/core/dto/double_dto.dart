import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

abstract class DoubleAttribute extends StyleAttribute<double> {
  final DoubleDto value;
  const DoubleAttribute(this.value);

  @override
  DoubleAttribute merge(DoubleAttribute? other);
  @override
  double resolve(MixData mix) => value.resolve(mix);

  @override
  List<Object?> get props => [value];
}

class DoubleDto extends ModifiableDto<double> {
  const DoubleDto(super.value, {super.modifier});

  static DoubleDto? maybeFrom(double? value) {
    return value == null ? null : DoubleDto(value);
  }

  @override
  DoubleDto merge(DoubleDto? other) {
    return DoubleDto(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }

  @override
  double resolve(MixData mix) => value;

  @override
  List<Object?> get props => [value];
}
