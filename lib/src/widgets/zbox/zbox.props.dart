import 'package:flutter/widgets.dart';

import '../../factory/mix_provider.dart';
import 'zbox.attributes.dart';

class ZBoxProps {
  final AlignmentGeometry alignment;
  final StackFit fit;
  final Clip clipBehavior;

  const ZBoxProps({
    required this.alignment,
    required this.fit,
    required this.clipBehavior,
  });

  factory ZBoxProps.fromContext(BuildContext context) {
    final mixContext = MixProvider.ensureOf(context);
    final zBoxAttributes = mixContext.attributesOfType<ZBoxAttributes>();

    return ZBoxProps(
      alignment: zBoxAttributes?.alignment ?? Alignment.topLeft,
      clipBehavior: zBoxAttributes?.clipBehavior ?? Clip.none,
      fit: zBoxAttributes?.fit ?? StackFit.loose,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZBoxProps &&
        other.alignment == alignment &&
        other.fit == fit &&
        other.clipBehavior == clipBehavior;
  }

  @override
  int get hashCode => alignment.hashCode ^ fit.hashCode ^ clipBehavior.hashCode;

  ZBoxProps copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    Clip? clipBehavior,
  }) {
    return ZBoxProps(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}
