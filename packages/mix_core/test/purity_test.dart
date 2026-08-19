// The purity gate: mix_core must never import Flutter or dart:ui, directly
// or transitively. This test enforces the direct-import half; the dependency
// graph half is enforced by the pubspec having no Flutter dependency (pub
// would fail to resolve `sdk: flutter` deps under plain `dart test`).

import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('no Flutter or dart:ui imports anywhere in lib/', () {
    final libDir = Directory('lib');
    final offenders = <String>[];

    for (final entity in libDir.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;

      final lines = entity.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i].trim();
        final isDirective =
            line.startsWith('import ') || line.startsWith('export ');
        if (!isDirective) continue;

        if (line.contains('package:flutter/') || line.contains('dart:ui')) {
          offenders.add('${entity.path}:${i + 1}: $line');
        }
      }
    }

    expect(
      offenders,
      isEmpty,
      reason: 'mix_core must stay pure Dart. Offending directives:\n'
          '${offenders.join('\n')}',
    );
  });
}
