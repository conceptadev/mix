import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

import '../converter_registry_init.dart';

bool _bound = false;

/// Wires mix's platform hooks into the mix_core engine (idempotent).
///
/// Called from every [core.Prop] creation and merge entry point in mix, so
/// the converter registry initializer and debug logging are guaranteed to be
/// in place before the engine can need them.
void ensureMixBindings() {
  if (_bound) return;
  _bound = true;

  core.mixCoreDebugLog = debugPrint;
  core.MixConverterRegistry.instanceOf<BuildContext>().initializer = (_) {
    initializeMixConverters();
  };
}
