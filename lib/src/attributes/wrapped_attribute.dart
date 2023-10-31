import '../core/attribute.dart';
import '../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
class WrappedStyleAttribute extends Attribute {
  final StyleMix style;

  const WrappedStyleAttribute(this.style);

  @override
  WrappedStyleAttribute merge(WrappedStyleAttribute? other) {
    if (other == null) return this;

    return WrappedStyleAttribute(style.merge(other.style));
  }

  @override
  get props => [style];
}
