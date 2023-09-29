import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import 'stack.attributes.dart';

class StyledStackDescriptor {
  final AlignmentGeometry alignment;
  final StackFit fit;
  final Clip clipBehavior;

  @override
  int get hashCode => alignment.hashCode ^ fit.hashCode ^ clipBehavior.hashCode;

  const StyledStackDescriptor({
    required this.alignment,
    required this.fit,
    required this.clipBehavior,
  });

  factory StyledStackDescriptor.fromContext(MixData mix) {
    final zBoxAttributes = mix.attributesOfType<StyledStackAttributes>();

    return StyledStackDescriptor(
      alignment: zBoxAttributes?.alignment ?? Alignment.topLeft,
      fit: zBoxAttributes?.fit ?? StackFit.loose,
      clipBehavior: zBoxAttributes?.clipBehavior ?? Clip.none,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyledStackDescriptor &&
        other.alignment == alignment &&
        other.fit == fit &&
        other.clipBehavior == clipBehavior;
  }

  StyledStackDescriptor copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    Clip? clipBehavior,
  }) {
    return StyledStackDescriptor(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}
