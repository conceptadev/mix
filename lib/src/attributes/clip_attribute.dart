import 'package:flutter/material.dart';

import '../core/attribute.dart';

class ClipAttribute extends ScalarAttribute<Clip> {
  const ClipAttribute(super.value);
  @override
  ClipAttribute merge(ClipAttribute? other) => other ?? this;
}
