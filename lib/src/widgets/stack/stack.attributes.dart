import 'package:flutter/widgets.dart';

import '../../attributes/attribute.dart';

@Deprecated('Use StyledStackAttributes instead')
typedef ZBoxAttributes = StyledStackAttributes;

class StyledStackAttributes extends StyledWidgetAttributes {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final Clip? clipBehavior;

  const StyledStackAttributes({this.alignment, this.fit, this.clipBehavior});

  @override
  get props => [alignment, fit, clipBehavior];
  @override
  StyledStackAttributes copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    Clip? clipBehavior,
  }) {
    return StyledStackAttributes(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  StyledStackAttributes merge(StyledStackAttributes? other) {
    if (other == null) return this;

    return copyWith(
      alignment: other.alignment,
      fit: other.fit,
      clipBehavior: other.clipBehavior,
    );
  }
}
