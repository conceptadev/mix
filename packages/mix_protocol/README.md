# mix_protocol

`mix_protocol` is the versioned JSON wire protocol for representable Mix
styles and token themes. It decodes untrusted JSON into real Mix stylers,
encodes supported runtime stylers into canonical JSON, and exports JSON Schema
for authoring tools.

The package is intentionally narrow:

- one fixed core v1 vocabulary for `box`, `text`, `flex`, `wrap`, `stack`,
  `icon`, `image`, `flex_box`, `wrap_box`, `stack_box`, and `grid_box` styles;
- one shared core-only `mixProtocol` façade, plus explicit immutable vocabulary
  composition for packages that define their own stylers;
- strict decode by default, with bounded lenient recovery for additive data;
- stable path-qualified diagnostics and fail-loud encoding;
- per-call icon and image identity resolution; and
- no runtime registry, import side effects, public Ack types, widget-tree
  model, transport, or persistence policy.

Ack powers the private bidirectional codecs and JSON Schema generation. The
wire semantics and compatibility policy belong to `mix_protocol`; consumers do
not depend on Ack.

## Quick start

```dart
import 'package:mix/mix.dart';
import 'package:mix_protocol/mix_protocol.dart';

final result = mixProtocol.decodeStyle<BoxStyler>({
  'v': 1,
  'type': 'box',
  'padding': 16,
  'decoration': {'color': '#3D5AFE'},
});

final style = switch (result) {
  MixProtocolSuccess<BoxStyler>(:final value) => value,
  MixProtocolFailure<BoxStyler>(:final errors) =>
    throw FormatException('$errors'),
};

final encoded = mixProtocol.encodeStyle(style);
final styleSchema = mixProtocol.exportStyleJsonSchema();
```

Theme documents use the same façade:

```dart
final theme = switch (mixProtocol.decodeTheme(themeJson)) {
  MixProtocolSuccess<MixProtocolTheme>(:final value) => value,
  MixProtocolFailure<MixProtocolTheme>(:final errors) =>
    throw FormatException('$errors'),
};

final scope = MixScope(tokens: theme.tokens, child: app);
final themeSchema = mixProtocol.exportThemeJsonSchema();
```

Every top-level document must carry `v: 1`; nested variant styles inherit the
root version. Explicit JSON `null` is forbidden. Unsupported runtime values
fail encode instead of being silently omitted.

Packages can contribute namespaced, independently versioned style words without
changing the core singleton. Composition is explicit and deterministic:

```dart
final chartProtocol = MixProtocol.compose([
  mixProtocolCoreVocabulary,
  mixChartVocabulary,
]);
```

Integration packages may also expose that deterministic composition as a
ready-to-use value; `mix_chart_protocol` provides `mixChartProtocol` for the
common core-plus-chart case.

Contributed discriminators include their vocabulary wire major, such as
`mix_chart.v1.line_chart`. See [GUIDE.md](GUIDE.md) for authoring and consuming
vocabularies.

## Protocol, schema, and future documents

These are distinct layers:

- **Protocol:** the accepted payloads, canonical output, versioning, recovery,
  identity, token, and diagnostic semantics implemented here.
- **JSON Schema:** a generated description of the style or theme input shape
  for editors and CI. It is an artifact of the protocol, not a parallel source
  of truth.
- **Document layer:** a future widget-tree or server-driven UI format may embed
  these per-node style payloads. Widget trees, events, and component identity
  are not part of `mix_protocol` v1.

`mix_winds` remains a direct Mix styler producer at runtime. Its test suite
uses `mix_protocol` as a development-only reference consumer to prove that a
broad `mix_winds` utility corpus is representable and canonical.

See [GUIDE.md](GUIDE.md) for integration patterns and
[WIRE_CONTRACT.md](WIRE_CONTRACT.md) for the complete v1 grammar.
