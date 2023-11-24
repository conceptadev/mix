import 'package:flutter/material.dart';

import '../core/attribute.dart';

class ClipBehaviorAttribute extends ScalarAttribute<Clip> {
  const ClipBehaviorAttribute(super.value);
  @override
  ClipBehaviorAttribute merge(ClipBehaviorAttribute? other) => other ?? this;
}
