import '../factory/mix_factory.dart';
import 'attribute.dart';

/// Allows to pass down Mixes as attributes for use with helpers
class NestedMixAttribute<T extends Attribute> extends Attribute {
  const NestedMixAttribute(StyleMix style) : _style = style;

  final StyleMix _style;

  StyleMix get value => _style;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NestedMixAttribute<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'NestedMixAttribute(style: $_style)';
}
