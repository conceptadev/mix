import '../factory/style_mix.dart';
import 'attribute.dart';

/// Allows to pass down Mixes as attributes for use with helpers
class NestedStyleAttribute extends StyleAttribute
    with Mergeable<NestedStyleAttribute> {
  const NestedStyleAttribute(this.style);

  final StyleMix style;

  @override
  NestedStyleAttribute merge(NestedStyleAttribute? other) {
    if (other == null) return this;

    return NestedStyleAttribute(style.merge(other.style));
  }

  @override
  get props => [style];
}
