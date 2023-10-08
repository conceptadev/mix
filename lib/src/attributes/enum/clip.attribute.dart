import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class ClipAttribute extends ResolvableAttribute<Clip> {
  final Clip clip;

  const ClipAttribute(this.clip);

  @override
  ClipAttribute merge(ClipAttribute? other) =>
      ClipAttribute(other?.clip ?? clip);

  @override
  Clip resolve(MixData mix) => clip;
  @override
  List<Object?> get props => [clip];
}
