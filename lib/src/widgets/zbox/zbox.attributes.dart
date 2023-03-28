import 'package:flutter/widgets.dart';

import '../../attributes/attribute.dart';

/// ## Widget:
/// - [ZBox](ZBox-class.html)
///
/// {@category Attributes}
class ZBoxAttributes extends WidgetAttributes {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final Clip? clipBehavior;

  const ZBoxAttributes({
    this.alignment,
    this.fit,
    this.clipBehavior,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZBoxAttributes &&
        other.alignment == alignment &&
        other.fit == fit &&
        other.clipBehavior == clipBehavior;
  }

  @override
  int get hashCode => alignment.hashCode ^ fit.hashCode ^ clipBehavior.hashCode;

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
}
