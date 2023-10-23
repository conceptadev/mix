import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class FlexFitAttribute extends StyleAttribute<FlexFit> {
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
