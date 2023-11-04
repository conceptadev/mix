import '../core/attribute.dart';
import '../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
class StyleMixAttribute extends Attribute {
  final StyleMix value;

  const StyleMixAttribute(this.value);

  @override
  StyleMixAttribute merge(StyleMixAttribute? other) {
    if (other == null) return this;

    return StyleMixAttribute(value.merge(other.value));
  }

  @override
  get props => [value];
}
