import '../factory/mix_provider_data.dart';
import 'attribute.dart';

class VisibleAttribute extends VisualAttribute<bool> {
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
