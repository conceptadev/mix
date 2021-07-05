import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class MainAxisSizeUtility {
  const MainAxisSizeUtility();
  MainAxisSizeAttribute get max =>
      const MainAxisSizeAttribute(MainAxisSize.max);
  MainAxisSizeAttribute get min =>
      const MainAxisSizeAttribute(MainAxisSize.min);
}

class MainAxisSizeAttribute extends Attribute<MainAxisSize> {
  const MainAxisSizeAttribute(MainAxisSize size) : _size = size;

  final MainAxisSize _size;
  @override
  MainAxisSize get value => _size;
}
