import 'package:flutter_test/flutter_test.dart';
import 'package:json_schema/json_schema.dart' as json_schema;
import 'package:mix/mix.dart';
import 'package:mix_protocol/mix_protocol.dart';

void main() {
  test('variant schemas enforce breakpoint selector alternatives', () {
    final schema = json_schema.JsonSchema.create(
      mixProtocol.exportStyleJsonSchema(),
    );
    for (final (fields, valid) in <(JsonMap, bool)>[
      ({'token': 'breakpoint.desktop'}, true),
      ({'minWidth': 600}, true),
      ({'maxWidth': 1024}, true),
      ({'minWidth': 600, 'maxWidth': 1024}, true),
      ({}, false),
      ({'token': 'breakpoint.desktop', 'minWidth': 600}, false),
      ({'token': 'breakpoint.desktop', 'maxWidth': 1024}, false),
    ]) {
      for (final nested in [false, true]) {
        final selector = {'kind': 'context_breakpoint', ...fields};
        final payload = {
          'v': 1,
          'type': 'box',
          'variants': [
            {
              if (nested) ...{
                'kind': 'context_not',
                'variant': selector,
              } else
                ...selector,
              'style': {'type': 'box', 'padding': 8},
            },
          ],
        };
        expect(schema.validate(payload).isValid, valid, reason: '$payload');
        expect(
          mixProtocol.decodeStyle<BoxStyler>(payload),
          valid
              ? isA<MixProtocolSuccess<BoxStyler>>()
              : isA<MixProtocolFailure<BoxStyler>>(),
          reason: '$payload',
        );
      }
    }
  });

  test('property schemas reject invalid terms and directive families', () {
    final schema = json_schema.JsonSchema.create(
      mixProtocol.exportStyleJsonSchema(),
    );
    for (final fields in <JsonMap>[
      {'padding': null},
      {
        'padding': {
          r'$merge': [true, false],
        },
      },
      {
        'padding': {r'$token': 'space.pad', 'kind': 'color'},
      },
      {
        'padding': {r'$token': 'invalid token name'},
      },
      {
        'decoration': {
          'color': {
            r'$merge': ['#123456'],
            'apply': [
              {'op': 'number_add', 'addend': 1},
            ],
          },
        },
      },
      {
        'decoration': {
          'color': {
            r'$merge': ['#123456'],
            'apply': [
              {'op': 'color_opacity', 'opacity': 'half'},
            ],
          },
        },
      },
    ]) {
      final payload = {'v': 1, 'type': 'box', ...fields};
      expect(
        mixProtocol.decodeStyle<BoxStyler>(payload),
        isA<MixProtocolFailure<BoxStyler>>(),
      );
      expect(schema.validate(payload).isValid, isFalse, reason: '$fields');
    }
  });

  test('theme schemas validate literal values and exact alias kinds', () {
    final schema = json_schema.JsonSchema.create(
      mixProtocol.exportThemeJsonSchema(),
    );
    const payload = {
      'v': 1,
      'type': 'theme',
      'spaces': {
        'space.base': 8,
        'space.alias': {r'$token': 'space.base', 'kind': 'space'},
      },
    };
    expect(schema.validate(payload).isValid, isTrue);
    expect(
      mixProtocol.decodeTheme(payload),
      isA<MixProtocolSuccess<MixProtocolTheme>>(),
    );
    expect(
      schema.validate({
        'v': 1,
        'type': 'theme',
        'spaces': {
          'space.alias': {r'$token': 'space.base', 'kind': 'double'},
        },
      }).isValid,
      isFalse,
    );
  });

  test('exported field schemas reject invalid literal types', () {
    final schema = json_schema.JsonSchema.create(
      mixProtocol.exportStyleJsonSchema(),
    );
    for (final field in <String, Object>{
      'padding': true,
      'clipBehavior': 17,
      'transform': [1, 2],
    }.entries) {
      final payload = {'v': 1, 'type': 'box', field.key: field.value};
      expect(
        mixProtocol.decodeStyle<BoxStyler>(payload),
        isA<MixProtocolFailure<BoxStyler>>(),
      );
      expect(schema.validate(payload).isValid, isFalse, reason: field.key);
    }
  });

  test('exported schemas accept canonical property terms', () {
    final schema = json_schema.JsonSchema.create(
      mixProtocol.exportStyleJsonSchema(),
    );
    for (final value in <Object>[
      16,
      {'left': 8, 'top': 4},
      {r'$token': 'space.pad', 'kind': 'space'},
      {
        r'$merge': [
          4,
          {'left': 8},
        ],
      },
    ]) {
      final payload = {'v': 1, 'type': 'box', 'padding': value};
      expect(
        mixProtocol.decodeStyle<BoxStyler>(payload),
        isA<MixProtocolSuccess<BoxStyler>>(),
      );
      expect(schema.validate(payload).isValid, isTrue, reason: '$value');
    }
  });
}
