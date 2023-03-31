import 'package:flutter/widgets.dart';

import '../../attributes/attribute.dart';

class ZBoxAttributes extends WidgetAttributes {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final Clip? clipBehavior;

  const ZBoxAttributes({
    this.alignment,
    this.fit,
    this.clipBehavior,
  });

  ZBoxAttributes copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    Clip? clipBehavior,
  }) {
    return ZBoxAttributes(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  ZBoxAttributes merge(ZBoxAttributes? other) {
    if (other == null) return this;

    return ZBoxAttributes(
      alignment: other.alignment ?? alignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      fit: other.fit ?? fit,
    );
  }

  @override
  get props => [
        alignment,
        fit,
        clipBehavior,
      ];
}
