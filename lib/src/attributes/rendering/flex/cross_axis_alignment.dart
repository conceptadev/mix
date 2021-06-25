import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class CrossAxisAligmentUtility {
  CrossAxisAlignmentAttribute get start =>
      CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
  CrossAxisAlignmentAttribute get end =>
      CrossAxisAlignmentAttribute(CrossAxisAlignment.end);
  CrossAxisAlignmentAttribute get center =>
      CrossAxisAlignmentAttribute(CrossAxisAlignment.center);
  CrossAxisAlignmentAttribute get stretch =>
      CrossAxisAlignmentAttribute(CrossAxisAlignment.stretch);
  CrossAxisAlignmentAttribute get baseline =>
      CrossAxisAlignmentAttribute(CrossAxisAlignment.baseline);
}

class CrossAxisAlignmentAttribute extends Attribute<CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(CrossAxisAlignment alignment)
      : _alignment = alignment;

  final CrossAxisAlignment _alignment;
  // Returns axis value
  CrossAxisAlignment get value => _alignment;
}
