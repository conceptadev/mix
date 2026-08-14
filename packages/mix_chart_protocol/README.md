# mix_chart_protocol

`mix_chart_protocol` contributes the complete public `mix_chart` styler surface
to `mix_protocol` without adding protocol dependencies to the publishable chart
runtime package.

```dart
import 'package:mix_chart_protocol/mix_chart_protocol.dart';
import 'package:mix_protocol/mix_protocol.dart';

final protocol = MixProtocol.compose([
  mixProtocolCoreVocabulary,
  mixChartVocabulary,
]);
```

The vocabulary uses the `mix_chart.v1.*` namespace and contains all 15 chart
stylers, including shared nested stylers. Core stylers such as `TextStyler`
inside chart labels recurse through the same composed union. Variants,
modifiers, animation, property terms, tokens, and lenient decoding use the
ordinary `mix_protocol` grammar.

This sidecar is unpublished while `mix_protocol` is unpublished. Keeping it
separate preserves `mix_chart`'s existing publish contract and avoids exposing
the private Ack implementation.
