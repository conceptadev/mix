import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class MainAxisSizeUtility {
  MainAxisSizeAttribute get max => MainAxisSizeAttribute(MainAxisSize.max);
  MainAxisSizeAttribute get min => MainAxisSizeAttribute(MainAxisSize.min);
}

class MainAxisSizeAttribute extends Attribute<MainAxisSize> {
  const MainAxisSizeAttribute(MainAxisSize size) : _size = size;

  final MainAxisSize _size;
  // Returns axis value
  MainAxisSize get value => _size;
}
