import 'package:flutter/widgets.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

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
