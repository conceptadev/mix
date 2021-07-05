import 'package:flutter/material.dart';

import '../base_attribute.dart';

class BoxShadowColorUtility {
  const BoxShadowColorUtility();
  BoxShadowAttribute call(Color color) {
    return BoxShadowAttribute(color: color);
  }
}

class BoxShadowOffsetUtility {
  const BoxShadowOffsetUtility();
  BoxShadowAttribute call(double x, double y) {
    return BoxShadowAttribute(offset: Offset(x, y));
  }
}

class BoxShadowBlurRadiusUtility {
  const BoxShadowBlurRadiusUtility();
  BoxShadowAttribute call(double blurRadius) {
    return BoxShadowAttribute(blurRadius: blurRadius);
  }
}

class BoxShadowSpreadRadiusUtility {
  const BoxShadowSpreadRadiusUtility();
  BoxShadowAttribute call(double spreadRadius) {
    return BoxShadowAttribute(spreadRadius: spreadRadius);
  }
}

class BoxShadowUtility {
  const BoxShadowUtility();
  BoxShadowColorUtility get color => const BoxShadowColorUtility();
  BoxShadowOffsetUtility get offset => const BoxShadowOffsetUtility();
  BoxShadowBlurRadiusUtility get blurRadius =>
      const BoxShadowBlurRadiusUtility();
  BoxShadowSpreadRadiusUtility get spreadRadius =>
      const BoxShadowSpreadRadiusUtility();
}

class BoxShadowAttribute extends Attribute<BoxShadow> {
  const BoxShadowAttribute({
    this.color,
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });

  final Color? color;
  final Offset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  static const _defaults = BoxShadow();

  static BoxShadowAttribute get none {
    return BoxShadowAttribute(
      color: _defaults.color,
      offset: _defaults.offset,
      blurRadius: _defaults.blurRadius,
      spreadRadius: _defaults.spreadRadius,
    );
  }

  @override
  BoxShadow get value {
    return BoxShadow(
      color: color ?? _defaults.color,
      offset: offset ?? _defaults.offset,
      blurRadius: blurRadius ?? _defaults.blurRadius,
      spreadRadius: spreadRadius ?? _defaults.spreadRadius,
    );
  }

  BoxShadowAttribute copyWith(BoxShadowAttribute other) {
    return BoxShadowAttribute(
      color: other.color ?? color,
      offset: other.offset ?? offset,
      blurRadius: other.blurRadius ?? blurRadius,
      spreadRadius: other.spreadRadius ?? spreadRadius,
    );
  }
}
