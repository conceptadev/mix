import 'package:flutter/material.dart';

import '../attributes/data_attributes.dart';
import '../core/dto/decoration_dto.dart';
import '../helpers/extensions/values_ext.dart';

DecorationAttribute backgroundColor(Color color) {
  return BoxDecorationData(color: color.toDto).toAttribute();
}
