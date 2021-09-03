import 'package:flutter/material.dart';

import '../../../base_attribute.dart';

class CrossAxisAligmentUtility {
  const CrossAxisAligmentUtility();
  CrossAxisAlignmentAttribute get start =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
  CrossAxisAlignmentAttribute get end =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.end);
  CrossAxisAlignmentAttribute get center =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.center);
  CrossAxisAlignmentAttribute get stretch =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.stretch);
  CrossAxisAlignmentAttribute get baseline =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.baseline);
}

class CrossAxisAlignmentAttribute extends Attribute<CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(CrossAxisAlignment alignment)
      : _alignment = alignment;

  final CrossAxisAlignment _alignment;
  @override
  CrossAxisAlignment get value => _alignment;
}
