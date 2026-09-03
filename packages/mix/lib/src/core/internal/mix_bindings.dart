import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

import '../converter_registry_init.dart';

bool _bound = false;

/// Wires mix's platform hooks into the mix_core engine (idempotent).
///
/// Called from the two points that can reach the engine's platform hooks —
/// [core.Prop.resolveProp] (via mix's `Prop` override) and the
/// `MixConverterRegistry.instance` accessor — so the converter registry
/// initializer and debug logging are in place before the engine needs them.
/// Creation paths deliberately do not call it: they are `const`.
void ensureMixBindings() {
  if (_bound) return;
  _bound = true;

  core.mixCoreDebugLog = debugPrint;
  core.MixConverterRegistry.instanceOf<BuildContext>().initializer = (_) {
    initializeMixConverters();
  };
}
