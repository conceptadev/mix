import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class FlexFitAttribute extends ResolvableAttribute<FlexFit> {
  final FlexFit fit;

  const FlexFitAttribute(this.fit);

  @override
  FlexFitAttribute merge(FlexFitAttribute? other) =>
      FlexFitAttribute(other?.fit ?? fit);

  @override
  FlexFit resolve(MixData mix) => fit;
  @override
  List<Object?> get props => [fit];
}
