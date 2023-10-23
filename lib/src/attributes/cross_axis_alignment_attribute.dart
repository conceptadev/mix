import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class CrossAxisAlignmentAttribute extends StyleAttribute<CrossAxisAlignment> {
  final CrossAxisAlignment alignment;

  const CrossAxisAlignmentAttribute(this.alignment);

  @override
  CrossAxisAlignmentAttribute merge(CrossAxisAlignmentAttribute? other) =>
      CrossAxisAlignmentAttribute(other?.alignment ?? alignment);

  @override
  CrossAxisAlignment resolve(MixData mix) => alignment;
  @override
  List<Object?> get props => [alignment];
}
