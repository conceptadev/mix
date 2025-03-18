import '../../core/element.dart';
import '../../core/factory/mix_data.dart';

class SpacingSideDto extends StyleProperty<double> {
  final double? value;

  const SpacingSideDto(this.value);

  @override
  SpacingSideDto merge(SpacingSideDto? other) {
    return SpacingSideDto(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) {
    return mix.tokens.spaceTokenRef(value ?? 0);
  }

  @override
  List<Object?> get props => [value];
}
