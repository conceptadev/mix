import 'package:flutter/material.dart';

import '../attributes/decoration_attribute.dart';
import '../helpers/extensions/helper_ext.dart';

BoxDecorationAttribute backgroundColor(Color color) {
  return BoxDecorationAttribute(color: color.dto);
}

@Deprecated('Use backgroundColor(style:style) instead')
BoxDecorationAttribute bgColor(Color color) => backgroundColor(color);
