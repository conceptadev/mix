import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class WidthAttribute extends ResolvableAttribute<double> {
  final double _width;

  const WidthAttribute(double width) : _width = width;

  @override
  WidthAttribute merge(WidthAttribute? other) {
    if (other == null) return this;

    return WidthAttribute(other._width);
  }

  @override
  double resolve(MixData mix) {
    return _width;
  }

  @override
  get props => [_width];
}

class HeightAttribute extends ResolvableAttribute<double> {
  final double _width;

  const HeightAttribute(double width) : _width = width;

  @override
  HeightAttribute merge(HeightAttribute? other) {
    if (other == null) return this;

    return HeightAttribute(other._width);
  }

  @override
  double resolve(MixData mix) {
    return _width;
  }

  @override
  get props => [_width];
}
