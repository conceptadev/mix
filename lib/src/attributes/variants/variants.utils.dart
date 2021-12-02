import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/variants/variant.attributes.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';

class VariantUtils {
  const VariantUtils._();
  static ScreenSizeAttribute xsmall(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSizeToken.xsmall,
    );
  }

  static ScreenSizeAttribute small(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSizeToken.small,
    );
  }

  static ScreenSizeAttribute medium(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSizeToken.medium,
    );
  }

  static ScreenSizeAttribute large(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSizeToken.large,
    );
  }

  static OrientationAttribute portrait(List<Attribute> attributes) {
    return OrientationAttribute(
      attributes,
      Orientation.portrait,
    );
  }

  static OrientationAttribute landscape(List<Attribute> attributes) {
    return OrientationAttribute(
      attributes,
      Orientation.landscape,
    );
  }

  static DarkModeAttribute dark(List<Attribute> attributes) {
    return DarkModeAttribute(attributes);
  }

  static VariantAttribute variant<T extends Attribute>(
      String variant, List<T> attributes) {
    return VariantAttribute(variant, attributes);
  }
}
