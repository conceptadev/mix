import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class MainAxisAlignmentUtility {
  MainAxisAlignmentAttribute get start =>
      MainAxisAlignmentAttribute(MainAxisAlignment.start);
  MainAxisAlignmentAttribute get end =>
      MainAxisAlignmentAttribute(MainAxisAlignment.end);
  MainAxisAlignmentAttribute get center =>
      MainAxisAlignmentAttribute(MainAxisAlignment.center);
  MainAxisAlignmentAttribute get spaceBetween =>
      MainAxisAlignmentAttribute(MainAxisAlignment.spaceBetween);
  MainAxisAlignmentAttribute get spaceAround =>
      MainAxisAlignmentAttribute(MainAxisAlignment.spaceAround);
  MainAxisAlignmentAttribute get spaceEvenly =>
      MainAxisAlignmentAttribute(MainAxisAlignment.spaceEvenly);
}

class MainAxisAlignmentAttribute extends Attribute<MainAxisAlignment> {
  const MainAxisAlignmentAttribute(MainAxisAlignment alignment)
      : _alignment = alignment;

  final MainAxisAlignment _alignment;
  // Returns axis value
  MainAxisAlignment get value => _alignment;
}
