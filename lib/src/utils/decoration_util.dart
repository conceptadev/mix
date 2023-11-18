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

const _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
const _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
const _kAmbientShadowOpacity = Color(0x1F000000); // alpha = 0.12

// Customized shadow map
const _elevationToShadow = <int, List<BoxShadow>>{
  // The empty list depicts no elevation.
  0: <BoxShadow>[],

  1: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 2.0),
      blurRadius: 1.0,
      spreadRadius: -1.0,
    ),
    BoxShadow(
        color: _kKeyPenumbraOpacity, offset: Offset(0.0, 1.0), blurRadius: 1.0),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 3.0,
    ),
  ],

  2: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 3.0),
      blurRadius: 1.0,
      spreadRadius: -2.0,
    ),
    BoxShadow(
        color: _kKeyPenumbraOpacity, offset: Offset(0.0, 2.0), blurRadius: 2.0),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 5.0,
    ),
  ],

  3: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 3.0),
      blurRadius: 3.0,
      spreadRadius: -2.0,
    ),
    BoxShadow(
        color: _kKeyPenumbraOpacity, offset: Offset(0.0, 3.0), blurRadius: 4.0),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 8.0,
    ),
  ],

  4: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 2.0),
      blurRadius: 4.0,
      spreadRadius: -1.0,
    ),
    BoxShadow(
        color: _kKeyPenumbraOpacity, offset: Offset(0.0, 4.0), blurRadius: 5.0),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 10.0,
    ),
  ],

  6: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 3.0),
      blurRadius: 5.0,
      spreadRadius: -1.0,
    ),
    BoxShadow(
      color: _kKeyPenumbraOpacity,
      offset: Offset(0.0, 6.0),
      blurRadius: 10.0,
    ),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 1.0),
      blurRadius: 18.0,
    ),
  ],

  8: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 5.0),
      blurRadius: 5.0,
      spreadRadius: -3.0,
    ),
    BoxShadow(
      color: _kKeyPenumbraOpacity,
      offset: Offset(0.0, 8.0),
      blurRadius: 10.0,
      spreadRadius: 1.0,
    ),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 3.0),
      blurRadius: 14.0,
      spreadRadius: 2.0,
    ),
  ],

  9: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 5.0),
      blurRadius: 6.0,
      spreadRadius: -3.0,
    ),
    BoxShadow(
      color: _kKeyPenumbraOpacity,
      offset: Offset(0.0, 9.0),
      blurRadius: 12.0,
      spreadRadius: 1.0,
    ),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 3.0),
      blurRadius: 16.0,
      spreadRadius: 2.0,
    ),
  ],

  12: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 7.0),
      blurRadius: 8.0,
      spreadRadius: -4.0,
    ),
    BoxShadow(
      color: _kKeyPenumbraOpacity,
      offset: Offset(0.0, 12.0),
      blurRadius: 17.0,
      spreadRadius: 2.0,
    ),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 5.0),
      blurRadius: 22.0,
      spreadRadius: 4.0,
    ),
  ],

  16: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 8.0),
      blurRadius: 10.0,
      spreadRadius: -5.0,
    ),
    BoxShadow(
      color: _kKeyPenumbraOpacity,
      offset: Offset(0.0, 16.0),
      blurRadius: 24.0,
      spreadRadius: 2.0,
    ),
    BoxShadow(
      color: _kAmbientShadowOpacity,
      offset: Offset(0.0, 6.0),
      blurRadius: 30.0,
      spreadRadius: 5.0,
    ),
  ],

  24: <BoxShadow>[
    BoxShadow(
      color: _kKeyUmbraOpacity,
      offset: Offset(0.0, 11.0),
      blurRadius: 15.0,
      spreadRadius: -7.0,
    ),
    BoxShadow(
      color: _kKeyPenumbraOpacity,
      offset: Offset(0.0, 24.0),
      blurRadius: 38.0,
      spreadRadius: 3.0,
    ),
    BoxShadow(
      color: _kAmbientShadowOpacity,
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
