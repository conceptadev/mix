import '../core/attribute.dart';
import '../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
class NestedStyleAttribute extends Attribute {
  final StyleMix style;

  const NestedStyleAttribute(this.style);

  @override
  NestedStyleAttribute merge(NestedStyleAttribute? other) {
    if (other == null) return this;

    return NestedStyleAttribute(style.merge(other.style));
  }

  @override
  get props => [style];
}
