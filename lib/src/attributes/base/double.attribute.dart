import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

typedef DoubleModifier = ValueModifier<double>;

abstract class DoubleAttribute extends ResolvableAttribute<double> {
  final double value;
  final DoubleModifier? modifier;

  const DoubleAttribute(this.value, {this.modifier});

  @override
  DoubleAttribute merge(DoubleAttribute? other);
  @override
  double resolve(MixData mix) => value;

  @override
  List<Object?> get props => [value];
}
