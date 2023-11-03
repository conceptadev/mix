import '../core/attribute.dart';
import '../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
class WrappedStyleAttribute extends Attribute {
  final StyleMix value;

  const WrappedStyleAttribute(this.value);

  @override
  WrappedStyleAttribute merge(WrappedStyleAttribute? other) {
    if (other == null) return this;

    return WrappedStyleAttribute(value.merge(other.value));
  }

  @override
  get props => [value];
}
