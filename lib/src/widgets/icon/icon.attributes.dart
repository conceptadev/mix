import '../../attributes/attribute.dart';
import '../../dtos/color.dto.dart';

/// ## Widget
/// - [IconMix](IconMix-class.html)
///
/// {@category Attributes}
class IconAttributes extends WidgetAttributes {
  final ColorDto? color;
  final double? size;
  const IconAttributes({
    this.color,
    this.size,
  });

  @override
  IconAttributes merge(IconAttributes? other) {
    if (other == null) return this;

    return IconAttributes(
      color: other.color ?? color,
      size: other.size ?? size,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconAttributes &&
        other.color == color &&
        other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
