import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class MainAxisAlignmentUtility {
  const MainAxisAlignmentUtility();
  MainAxisAlignmentAttribute get start =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.start);
  MainAxisAlignmentAttribute get end =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.end);
  MainAxisAlignmentAttribute get center =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.center);
  MainAxisAlignmentAttribute get spaceBetween =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceBetween);
  MainAxisAlignmentAttribute get spaceAround =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceAround);
  MainAxisAlignmentAttribute get spaceEvenly =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceEvenly);
}

class MainAxisAlignmentAttribute extends Attribute<MainAxisAlignment> {
  const MainAxisAlignmentAttribute(MainAxisAlignment alignment)
      : _alignment = alignment;

  final MainAxisAlignment _alignment;
  @override
  MainAxisAlignment get value => _alignment;
}
