import 'dart:convert';
import 'dart:io';

import '../contract/json_map.dart';

/// One JSON document that an exported schema must accept or reject.
final class SchemaFixtureCase {
  final String name;

  final JsonMap payload;
  const SchemaFixtureCase(this.name, this.payload);
}

/// One exported schema and the documents that pin its acceptance boundary.
///
/// [schema] is written beside the fixtures when present. A suite that
/// validates against another package's schema leaves it null and points
/// [schemaPath] at that file relative to the fixture root.
final class SchemaFixtureSuite {
  final String name;

  final JsonMap? schema;
  final String schemaPath;
  final List<SchemaFixtureCase> accept;
  final List<SchemaFixtureCase> reject;

  SchemaFixtureSuite({
    required this.name,
    this.schema,
    String? schemaPath,
    required this.accept,
    required this.reject,
  }) : schemaPath = schemaPath ?? '$name.schema.json' {
    if (schema == null && this.schemaPath == '$name.schema.json') {
      throw ArgumentError.value(
        schemaPath,
        'schemaPath',
        'A suite without its own schema must name the schema it validates.',
      );
    }
    for (final (label, cases) in [('accept', accept), ('reject', reject)]) {
      final names = <String>{};
      for (final fixture in cases) {
        if (!names.add(fixture.name)) {
          throw ArgumentError('Duplicate $label fixture "${fixture.name}".');
        }
      }
    }
  }

  static JsonMap _fixtureJson(SchemaFixtureCase fixture) => {
    'name': fixture.name,
    'payload': fixture.payload,
  };

  String get fixturesPath => 'fixtures/$name.json';

  JsonMap get manifestEntry => {
    'name': name,
    'schema': schemaPath,
    'fixtures': fixturesPath,
  };

  JsonMap get fixturesDocument => {
    'accept': [for (final fixture in accept) _fixtureJson(fixture)],
    'reject': [for (final fixture in reject) _fixtureJson(fixture)],
  };
}

/// Writes or verifies a package's checked-in `schema/` directory.
///
/// The directory holds `manifest.json`, one `<name>.schema.json` per suite
/// that owns a schema, and `fixtures/<name>.json` with the accept and reject
/// documents. External validators such as Ajv read these files directly.
///
/// With [update] the files are rewritten. Otherwise the current files are
/// compared with the expected output and every stale or missing path is
/// returned, so a test can fail with the exact regeneration needed.
List<String> syncSchemaFixtures(
  Directory root,
  List<SchemaFixtureSuite> suites, {
  required bool update,
}) {
  final expected = <String, String>{
    'manifest.json': _pretty({
      'suites': [for (final suite in suites) suite.manifestEntry],
    }),
    for (final suite in suites)
      if (suite.schema case final schema?) suite.schemaPath: _pretty(schema),
    for (final suite in suites)
      suite.fixturesPath: _pretty(suite.fixturesDocument),
  };

  final stale = <String>[];
  for (final entry in expected.entries) {
    final file = File('${root.path}/${entry.key}');
    if (update) {
      file
        ..createSync(recursive: true)
        ..writeAsStringSync(entry.value);
      continue;
    }
    if (!file.existsSync()) {
      stale.add('${entry.key} is missing');
    } else if (file.readAsStringSync() != entry.value) {
      stale.add('${entry.key} is stale');
    }
  }

  return stale;
}

String _pretty(Object? json) =>
    '${const JsonEncoder.withIndent('  ').convert(json)}\n';
