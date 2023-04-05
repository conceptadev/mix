import '../../attributes/attribute.dart';
import '../../dtos/color.dto.dart';

class IconAttributes extends WidgetAttributes {
  final ColorDto? color;
  final double? size;
  const IconAttributes({
    this.color,
    this.size,
  });

  @override
  IconAttributes copyWith({
    ColorDto? color,
    double? size,
  }) {
    return IconAttributes(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  @override
  IconAttributes merge(IconAttributes? other) {
    if (other == null) return this;

    return copyWith(
      color: other.color,
      size: other.size,
    );
  }

  @override
  get props => [
        color,
        size,
      ];
}
