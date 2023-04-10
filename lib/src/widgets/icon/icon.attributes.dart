import '../../attributes/attribute.dart';
import '../../dtos/color.dto.dart';

@Deprecated('Use IconStyleAttributes instead')
typedef IconAttributes = StyledIconAttributes;

class StyledIconAttributes extends StyledWidgetAttributes {
  final ColorDto? color;
  final double? size;
  const StyledIconAttributes({
    this.color,
    this.size,
  });

  @override
  StyledIconAttributes copyWith({
    ColorDto? color,
    double? size,
  }) {
    return StyledIconAttributes(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  @override
  StyledIconAttributes merge(StyledIconAttributes? other) {
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
