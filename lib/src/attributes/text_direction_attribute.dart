import 'package:flutter/material.dart';

import '../core/attribute.dart';

class TextDirectionAttribute extends ScalarAttribute<TextDirection> {
  const TextDirectionAttribute(super.value);
  @override
  TextDirectionAttribute merge(TextDirectionAttribute? other) => other ?? this;
}
