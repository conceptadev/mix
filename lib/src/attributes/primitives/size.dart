import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_attribute.dart';

part 'size.freezed.dart';

class SizeUtility<T extends SizeAttribute> {
  T call(double size) => SizeAttribute.create<T>(size);
}

/// Size attribute
@freezed
class SizeAttribute extends Attribute<double> with _$SizeAttribute {
  const SizeAttribute._();

  /// Constructor
  factory SizeAttribute(double size) = _SizeAttribute;

  factory SizeAttribute.height(double size) = HeightAttribute;
  factory SizeAttribute.maxHeight(double size) = MaxHeightAttribute;
  factory SizeAttribute.minHeight(double size) = MinHeightAttribute;
  factory SizeAttribute.width(double size) = WidthAttribute;
  factory SizeAttribute.maxWidth(double size) = MaxWidthAttribute;
  factory SizeAttribute.minWidth(double size) = MinWidthAttribute;
  factory SizeAttribute.gap(double size) = GapAttribute;

  double get value {
    return size;
  }

  /// Create instance a class of SizeAttribute
  static T create<T extends SizeAttribute>(double size) {
    assert(T != SizeAttribute);
    switch (T) {
      case HeightAttribute:
        return HeightAttribute(size) as T;
      case MaxHeightAttribute:
        return MaxHeightAttribute(size) as T;
      case MinHeightAttribute:
        return MinHeightAttribute(size) as T;
      case WidthAttribute:
        return WidthAttribute(size) as T;
      case MaxWidthAttribute:
        return MaxWidthAttribute(size) as T;
      case MinWidthAttribute:
        return MinWidthAttribute(size) as T;
      case GapAttribute:
        return GapAttribute(size) as T;

      default:
        throw Exception('Cannot create SizeAttribute of $T');
    }
  }
}
