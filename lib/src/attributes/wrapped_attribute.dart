import '../core/attribute.dart';
import '../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
class WrappedStyleAttribute extends Attribute {
  final StyleMix _style;

  const WrappedStyleAttribute(StyleMix style) : _style = style;

  StyleMix get value => _style;

  @override
  WrappedStyleAttribute merge(WrappedStyleAttribute? other) {
    if (other == null) return this;

    return WrappedStyleAttribute(_style.merge(other._style));
  }

  @override
  get props => [_style];
}
