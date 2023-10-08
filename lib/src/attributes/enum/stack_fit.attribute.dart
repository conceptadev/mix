import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class StackFitAttribute extends ResolvableAttribute<StackFit> {
  final StackFit fit;

  const StackFitAttribute(this.fit);

  @override
  StackFitAttribute merge(StackFitAttribute? other) =>
      StackFitAttribute(other?.fit ?? fit);

  @override
  StackFit resolve(MixData mix) => fit;

  @override
  List<Object?> get props => [fit];
}
