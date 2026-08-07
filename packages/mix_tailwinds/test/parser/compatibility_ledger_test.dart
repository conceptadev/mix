import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix_tailwinds/src/parser/data/compatibility_ledger.g.dart';

void main() {
  final snapshot = _readSnapshot();

  test('ledger classifies every pinned utility and variant registration', () {
    final expectedUtilities = <String>{
      for (final root in _roots(snapshot, 'staticUtilityRoots'))
        _key(TailwindRegistryRootKind.staticUtility, root),
      for (final root in _roots(snapshot, 'functionalUtilityRoots'))
        _key(TailwindRegistryRootKind.functionalUtility, root),
    };
    final expectedVariants = <String>{
      for (final root in _roots(snapshot, 'staticVariantRoots'))
        _key(TailwindRegistryRootKind.staticVariant, root),
      for (final root in _roots(snapshot, 'functionalVariantRoots'))
        _key(TailwindRegistryRootKind.functionalVariant, root),
      for (final root in _roots(snapshot, 'compoundVariantRoots'))
        _key(TailwindRegistryRootKind.compoundVariant, root),
    };
    final actualUtilities = {
      for (final entry in generatedTailwindUtilityCompatibilityLedger)
        _key(entry.kind, entry.root),
    };
    final actualVariants = {
      for (final entry in generatedTailwindVariantCompatibilityLedger)
        _key(entry.kind, entry.root),
    };

    expect(generatedTailwindUtilityCompatibilityLedger, hasLength(599));
    expect(generatedTailwindVariantCompatibilityLedger, hasLength(90));
    expect(actualUtilities, hasLength(599), reason: 'duplicate utility key');
    expect(actualVariants, hasLength(90), reason: 'duplicate variant key');
    expect(actualUtilities, expectedUtilities);
    expect(actualVariants, expectedVariants);
    expect(
      generatedTailwindCompatibilityMeta,
      (snapshot['meta']! as Map).cast<String, Object?>(),
    );
  });

  test('ledger statuses carry the required accounting detail', () {
    const allowedLabels = {
      'implemented',
      'adapted',
      'unsupported',
      'ignored-by-design',
    };
    final entries = [
      ...generatedTailwindUtilityCompatibilityLedger,
      ...generatedTailwindVariantCompatibilityLedger,
    ];

    for (final entry in entries) {
      expect(allowedLabels, contains(entry.status.label), reason: entry.root);
      switch (entry.status) {
        case TailwindCompatibilityStatus.implemented:
          expect(entry.reason, isNull, reason: entry.root);
        case TailwindCompatibilityStatus.adapted:
          expect(
            entry.reason,
            contains('FLUTTER_ADAPTATIONS.md'),
            reason: entry.root,
          );
        case TailwindCompatibilityStatus.unsupported:
          expect(entry.reason, isNull, reason: entry.root);
        case TailwindCompatibilityStatus.ignoredByDesign:
          expect(entry.reason, isNotEmpty, reason: entry.root);
          expect(
            entry.reason,
            contains('FLUTTER_ADAPTATIONS.md'),
            reason: entry.root,
          );
      }
    }
  });

  test('adapted variant policy matches the implemented runtime behavior', () {
    final focusVisible = generatedTailwindVariantCompatibilityLedger
        .singleWhere((entry) => entry.root == 'focus-visible');
    final themeMidnight = generatedTailwindVariantCompatibilityLedger
        .singleWhere((entry) => entry.root == 'theme-midnight');

    expect(focusVisible.status, TailwindCompatibilityStatus.adapted);
    expect(focusVisible.reason, contains('focus-visible state'));
    expect(focusVisible.reason, isNot(contains('broader Mix focus state')));
    expect(themeMidnight.status, TailwindCompatibilityStatus.unsupported);
    expect(themeMidnight.reason, isNull);
  });

  test('checked-in registries match generator output', () {
    final result = Process.runSync(_dartExecutable(), [
      'tool/gen_registry.dart',
      '--check',
    ], workingDirectory: Directory.current.path);

    expect(
      result.exitCode,
      0,
      reason: 'stdout:\n${result.stdout}\nstderr:\n${result.stderr}',
    );
  });
}

Map<String, Object?> _readSnapshot() {
  final decoded = jsonDecode(
    File('tool/tailwind_parser_registry_snapshot.json').readAsStringSync(),
  );
  return (decoded as Map).cast<String, Object?>();
}

List<String> _roots(Map<String, Object?> snapshot, String key) =>
    (snapshot[key]! as List).cast<String>();

String _key(TailwindRegistryRootKind kind, String root) => '${kind.name}:$root';

String _dartExecutable() {
  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot != null) {
    final bundled = File('$flutterRoot/bin/cache/dart-sdk/bin/dart');
    if (bundled.existsSync()) return bundled.path;
  }

  final resolved = File(Platform.resolvedExecutable);
  if (resolved.uri.pathSegments.last == 'dart') return resolved.path;

  throw StateError('Unable to locate the Dart executable for generator check.');
}
