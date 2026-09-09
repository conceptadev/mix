import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix_protocol/mix_protocol.dart';
import 'package:mix_protocol/testing.dart';

import 'schema_fixtures/core_schema_cases.dart';

/// Keeps `schema/` current: the exported style and theme schemas plus the
/// documents that pin their acceptance boundary.
///
/// Regenerate with `flutter test --update-goldens test/schema_fixtures_test.dart`
/// (or `melos run schema:fixtures`). The Ajv check in `tool/schema-check`
/// validates the checked-in files independently of Ack.
void main() {
  final suites = [
    SchemaFixtureSuite(
      name: 'style',
      schema: mixProtocol.exportStyleJsonSchema(),
      accept: styleAcceptCases,
      reject: styleRejectCases,
    ),
    SchemaFixtureSuite(
      name: 'theme',
      schema: mixProtocol.exportThemeJsonSchema(),
      accept: themeAcceptCases,
      reject: themeRejectCases,
    ),
  ];

  test('checked-in schema and fixtures are current', () {
    final stale = syncSchemaFixtures(
      Directory('schema'),
      suites,
      update: autoUpdateGoldenFiles,
    );

    expect(
      stale,
      isEmpty,
      reason:
          'Run `flutter test --update-goldens test/schema_fixtures_test.dart` '
          'in packages/mix_protocol and commit the result.',
    );
  });

  test('exported style schema is a Draft 7 document', () {
    final schema = mixProtocol.exportStyleJsonSchema();

    expect(schema[r'$schema'], 'http://json-schema.org/draft-07/schema#');
    expect(schema['x-mix-protocol-contract'], 'mix_protocol');
    expect(schema['x-mix-protocol-format-version'], mixProtocolFormatVersion);
  });
}
