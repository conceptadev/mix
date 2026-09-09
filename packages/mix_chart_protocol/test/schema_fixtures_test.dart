import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix_chart_protocol/mix_chart_protocol.dart';
import 'package:mix_protocol/testing.dart';

import 'schema_fixtures/chart_schema_cases.dart';

/// Keeps `schema/` current: the composed chart style schema plus the
/// documents that pin its acceptance boundary and the declared v1 wire.
///
/// Regenerate with `flutter test --update-goldens test/schema_fixtures_test.dart`
/// (or `melos run schema:fixtures`). The Ajv check in
/// `packages/mix_protocol/tool/schema-check` validates the checked-in files.
void main() {
  test('checked-in schema and fixtures are current', () {
    final protocol = mixChartProtocol;
    final accept = <SchemaFixtureCase>[
      for (final (index, style) in populatedChartStyles().indexed)
        SchemaFixtureCase(
          'populated ${style.runtimeType} $index',
          switch (protocol.encodeStyle(style)) {
            MixProtocolSuccess<JsonMap>(:final value) => value,
            MixProtocolFailure<JsonMap>(:final errors) => fail('$errors'),
          },
        ),
      for (final (branch, fields, valid) in chartFieldCases)
        if (valid)
          SchemaFixtureCase(
            '$branch ${fields.keys.single} accepted: ${fields.values.single}',
            chartFieldPayload(branch, fields),
          ),
    ];
    final reject = <SchemaFixtureCase>[
      for (final (branch, fields, valid) in chartFieldCases)
        if (!valid)
          SchemaFixtureCase(
            '$branch ${fields.keys.single} rejected: ${fields.values.single}',
            chartFieldPayload(branch, fields),
          ),
    ];

    final stale = syncSchemaFixtures(Directory('schema'), [
      SchemaFixtureSuite(
        name: 'style',
        schema: protocol.exportStyleJsonSchema(),
        accept: accept,
        reject: reject,
      ),
    ], update: autoUpdateGoldenFiles);

    expect(
      stale,
      isEmpty,
      reason:
          'Run `flutter test --update-goldens test/schema_fixtures_test.dart` '
          'in packages/mix_chart_protocol and commit the result.',
    );
  });
}
