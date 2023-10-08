import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

class MainAxisAlignmentAttribute extends StyleAttribute<MainAxisAlignment> {
  final MainAxisAlignment alignment;

  const MainAxisAlignmentAttribute(this.alignment);

  @override
  MainAxisAlignmentAttribute merge(MainAxisAlignmentAttribute? other) =>
      MainAxisAlignmentAttribute(other?.alignment ?? alignment);

  @override
  MainAxisAlignment resolve(MixData mix) => alignment;
  @override
  List<Object?> get props => [alignment];
}
