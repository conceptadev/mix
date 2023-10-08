import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class VisibleAttribute extends ResolvableAttribute<bool> {
  final bool _visible;

  const VisibleAttribute(bool visible) : _visible = visible;

  @override
  VisibleAttribute merge(VisibleAttribute? other) {
    if (other == null) return this;

    return VisibleAttribute(other._visible);
  }

  @override
  bool resolve(MixData mix) {
    return _visible;
  }

  @override
  get props => [_visible];
}
