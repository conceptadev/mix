import '../../core/dto.dart';
import '../../core/factory/mix_data.dart';

class GapDto extends Dto<double> {
  final double? value;

  const GapDto(this.value);

  @override
  GapDto merge(GapDto? other) {
    return GapDto(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) {
    return mix.tokens.spaceTokenRef(value ?? defaultValue);
  }

  @override
  double get defaultValue => 0;

  @override
  List<Object?> get props => [value];
}
