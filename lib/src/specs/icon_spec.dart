import 'dart:ui';

import '../attributes/data_attributes.dart';
import '../attributes/scalar_attribute.dart';
import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

class IconSpec extends MixExtension<IconSpec> {
  final Color? color;
  final double? size;

  final TextDirection? textDirection;

  const IconSpec({
    required this.color,
    required this.size,
    required this.textDirection,
  });

  static IconSpec resolve(MixData mix) {
    return IconSpec(
      color: mix.get<IconColorAttribute, Color>(),
      size: mix.get<IconSizeAttribute, double>(),
      textDirection: mix.get<TextDirectionAttribute, TextDirection>(),
    );
  }

  @override
  IconSpec lerp(IconSpec other, double t) {
    return IconSpec(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
      textDirection: snap(textDirection, other.textDirection, t),
    );
  }

  @override
  IconSpec copyWith({
    Color? color,
    double? size,
    TextDirection? textDirection,
  }) {
    return IconSpec(
      color: color ?? this.color,
      size: size ?? this.size,
      textDirection: textDirection ?? this.textDirection,
    );
  }

  @override
  get props => [color, size, textDirection];
}
