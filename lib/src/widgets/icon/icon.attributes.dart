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
  get props => [
        color,
        size,
      ];
}
