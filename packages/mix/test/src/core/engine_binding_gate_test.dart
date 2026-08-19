// Guards the mix_core extraction: the engine types below are declared in
// package:mix_core and bound (subclassed, aliased, or re-exported) by mix.
// A stale duplicate declaration inside packages/mix/lib would silently fork
// the hierarchy — generated code would bind to one copy and hand-written
// code to the other.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mix does not redeclare engine types owned by mix_core', () {
    // Type name -> declaration patterns that would indicate a fork. The mix
    // bindings (e.g. `class Prop<V> extends core.Prop`) are expected; a
    // declaration NOT referencing mix_core is a fork.
    final forbidden = <RegExp>[
      RegExp(r'^mixin Equatable\b', multiLine: true),
      RegExp(r'^(abstract )?class Mixable<', multiLine: true),
      RegExp(r'^mixin Resolvable<', multiLine: true),
      RegExp(r'^class DeepCollectionEquality\b', multiLine: true),
      RegExp(r'^(abstract )?class Spec<', multiLine: true),
      RegExp(r'^abstract class Directive<', multiLine: true),
      RegExp(r'^(sealed|abstract) class PropSource<', multiLine: true),
      RegExp(r'^class PropOps\b', multiLine: true),
    ];

    final offenders = <String>[];
    final libDir = Directory('lib');

    for (final entity in libDir.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final content = entity.readAsStringSync();
      for (final pattern in forbidden) {
        if (pattern.hasMatch(content)) {
          offenders.add('${entity.path}: ${pattern.pattern}');
        }
      }
    }

    expect(
      offenders,
      isEmpty,
      reason:
          'These declarations fork types owned by mix_core — bind or '
          're-export them instead:\n${offenders.join('\n')}',
    );
  });
}
