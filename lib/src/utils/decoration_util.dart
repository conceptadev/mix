import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/decoration_attribute.dart';
import '../attributes/shadow_attribute.dart';
import '../helpers/extensions/values_ext.dart';

const backgroundColor = ColorUtility(BoxDecorationAttribute.color);
const bgColor = backgroundColor;

const boxDecoration = BoxDecorationAttribute.new;

BoxDecorationAttribute elevation(int value) {
  assert([1, 2, 3, 4, 6, 8, 9, 12, 16, 24].contains(value));

  return BoxDecorationAttribute(
    boxShadow: elevationToShadow[value]!.toAttribute(),
  );
}

// Custom naming that suits the context of your package
const elevationToShadow = _elevationToShadow;

// Adjust these colors to fit your package's theme or style
const _umbraOpacity = Color(0x33000000); // alpha = 0.2
const _penumbraOpacity = Color(0x24000000); // alpha = 0.14
const _ambientShadowOpacity = Color(0x1F000000); // alpha = 0.12

// Customized shadow map
const _elevationToShadow = <int, List<BoxShadow>>{
  0: <BoxShadow>[],
  1: <BoxShadow>[
    BoxShadow(
      color: _umbraOpacity,
      offset: Offset(0.0, 2.0),
      blurRadius: 1.0,
      spreadRadius: -1.0,
    ),
    BoxShadow(
      color: _penumbraOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 1.0,
    ),
    BoxShadow(
      color: _ambientShadowOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 3.0,
    ),
  ],
  // ... Include other elevation levels here, up to 24, as in the original map
  24: <BoxShadow>[
    BoxShadow(
      color: _umbraOpacity,
      offset: Offset(0.0, 11.0),
      blurRadius: 15.0,
      spreadRadius: -7.0,
    ),
    BoxShadow(
      color: _penumbraOpacity,
      offset: Offset(0.0, 24.0),
      blurRadius: 38.0,
      spreadRadius: 3.0,
    ),
    BoxShadow(
      color: _ambientShadowOpacity,
      offset: Offset(0.0, 9.0),
      blurRadius: 46.0,
      spreadRadius: 8.0,
    ),
  ],
};

extension on List<BoxShadow> {
  List<BoxShadowAttribute> toAttribute() {
    return map((e) => BoxShadowAttribute(
          color: e.color.toAttribute(),
          offset: e.offset,
          blurRadius: e.blurRadius,
          spreadRadius: e.spreadRadius,
        )).toList();
  }
}
