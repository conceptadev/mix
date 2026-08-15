import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix_protocol/authoring.dart';
import 'package:mix_protocol/mix_protocol.dart';

void main() {
  test('composes a versioned contributed branch with the core vocabulary', () {
    final count = MixProtocolField.direct<_CounterStyler, int>(
      wire: 'count',
      codec: MixProtocolCodecs.integer(),
      read: (value) => value.count,
    );
    final vocabulary = MixProtocolVocabulary(
      id: 'test_styles',
      wireVersion: 1,
      branches: [
        MixProtocolStylerBranch<_CounterStyler>(
          name: 'counter',
          codec: (_) => MixProtocolStylerCodec(
            fields: [count],
            build: (data) => _CounterStyler(count.value(data)),
          ),
        ),
      ],
    );
    final protocol = MixProtocol.compose([
      mixProtocolCoreVocabulary,
      vocabulary,
    ]);

    expect(
      protocol.encodeStyle(const _CounterStyler(3)),
      isA<MixProtocolSuccess<JsonMap>>().having(
        (result) => result.value,
        'value',
        {'type': 'test_styles.v1.counter', 'count': 3, 'v': 1},
      ),
    );
    expect(
      protocol.decodeStyle<_CounterStyler>({
        'v': 1,
        'type': 'test_styles.v1.counter',
        'count': 4,
      }),
      isA<MixProtocolSuccess<_CounterStyler>>().having(
        (result) => result.value,
        'value',
        const _CounterStyler(4),
      ),
    );

    final schema = protocol.exportStyleJsonSchema();
    expect(schema['x-mix-protocol-vocabularies'], [
      {'id': 'test_styles', 'wireVersion': 1},
    ]);
  });

  test('composition is deterministic regardless of extension order', () {
    final alpha = _emptyVocabulary<_AlphaStyler>(
      id: 'alpha_styles',
      branchName: 'alpha',
      build: () => const _AlphaStyler(),
    );
    final beta = _emptyVocabulary<_BetaStyler>(
      id: 'beta_styles',
      branchName: 'beta',
      build: () => const _BetaStyler(),
    );

    final first = MixProtocol.compose([beta, mixProtocolCoreVocabulary, alpha]);
    final second = MixProtocol.compose([
      alpha,
      beta,
      mixProtocolCoreVocabulary,
    ]);

    expect(
      jsonEncode(first.exportStyleJsonSchema()),
      jsonEncode(second.exportStyleJsonSchema()),
    );
    expect(first.exportStyleJsonSchema()['x-mix-protocol-vocabularies'], [
      {'id': 'alpha_styles', 'wireVersion': 1},
      {'id': 'beta_styles', 'wireVersion': 1},
    ]);
  });

  test('composition is deterministic regardless of branch order', () {
    final alpha = _emptyBranch<_AlphaStyler>(
      name: 'alpha',
      build: () => const _AlphaStyler(),
    );
    final beta = _emptyBranch<_BetaStyler>(
      name: 'beta',
      build: () => const _BetaStyler(),
    );
    final first = MixProtocol.compose([
      mixProtocolCoreVocabulary,
      MixProtocolVocabulary(
        id: 'test_styles',
        wireVersion: 1,
        branches: [beta, alpha],
      ),
    ]);
    final second = MixProtocol.compose([
      mixProtocolCoreVocabulary,
      MixProtocolVocabulary(
        id: 'test_styles',
        wireVersion: 1,
        branches: [alpha, beta],
      ),
    ]);

    expect(
      jsonEncode(first.exportStyleJsonSchema()),
      jsonEncode(second.exportStyleJsonSchema()),
    );
  });

  test('core-only composition preserves the shared schema byte for byte', () {
    final composed = MixProtocol.compose([mixProtocolCoreVocabulary]);

    expect(
      jsonEncode(composed.exportStyleJsonSchema()),
      jsonEncode(mixProtocol.exportStyleJsonSchema()),
    );
    expect(
      composed.exportStyleJsonSchema(),
      isNot(contains('x-mix-protocol-vocabularies')),
    );
  });

  test(
    'extension composition leaves core documents byte for byte unchanged',
    () {
      final extension = _emptyVocabulary<_AlphaStyler>(
        id: 'alpha_styles',
        branchName: 'alpha',
        build: () => const _AlphaStyler(),
      );
      final composed = MixProtocol.compose([
        mixProtocolCoreVocabulary,
        extension,
      ]);
      const payload = <String, Object?>{'v': 1, 'type': 'box', 'padding': 8};
      final decoded = mixProtocol.decodeStyle<Object>(payload);
      expect(decoded, isA<MixProtocolSuccess<Object>>());
      final style = (decoded as MixProtocolSuccess<Object>).value;
      final coreEncoded = mixProtocol.encodeStyle(style);
      final composedEncoded = composed.encodeStyle(style);

      expect(coreEncoded, isA<MixProtocolSuccess<JsonMap>>());
      expect(composedEncoded, isA<MixProtocolSuccess<JsonMap>>());
      expect(
        (composedEncoded as MixProtocolSuccess<JsonMap>).value,
        (coreEncoded as MixProtocolSuccess<JsonMap>).value,
      );
    },
  );

  test('core-only decoders reject an uncomposed root in both modes', () {
    const payload = {'v': 1, 'type': 'test_styles.v1.counter', 'count': 4};

    for (final mode in MixProtocolDecodeMode.values) {
      final result = mixProtocol.decodeStyle<Object>(
        payload,
        options: MixProtocolDecodeOptions(mode: mode),
      );

      expect(result, isA<MixProtocolFailure<Object>>(), reason: mode.name);
      expect(
        (result as MixProtocolFailure<Object>).errors,
        contains(
          isA<MixProtocolError>().having(
            (error) => error.code,
            'code',
            MixProtocolErrorCode.unknownType,
          ),
        ),
        reason: mode.name,
      );
    }
  });

  test('vocabulary snapshots its branch list', () {
    final branch = _emptyBranch<_AlphaStyler>(
      name: 'alpha',
      build: () => const _AlphaStyler(),
    );
    final branches = <MixProtocolStylerBranchBase>[branch];
    final vocabulary = MixProtocolVocabulary(
      id: 'alpha_styles',
      wireVersion: 1,
      branches: branches,
    );

    branches.clear();

    expect(vocabulary.branches, [branch]);
    expect(() => vocabulary.branches.add(branch), throwsUnsupportedError);
  });

  test('styler codec snapshots its owner inventory', () {
    final inventory = <String>{'count'};
    final count = MixProtocolField.direct<_CounterStyler, int>(
      wire: 'count',
      codec: MixProtocolCodecs.integer(),
      read: (value) => value.count,
    );
    final vocabulary = MixProtocolVocabulary(
      id: 'counter_styles',
      wireVersion: 1,
      branches: [
        MixProtocolStylerBranch<_CounterStyler>(
          name: 'counter',
          codec: (_) => MixProtocolStylerCodec(
            fields: [count],
            inventoryOwner: '_CounterStyler',
            ownerFieldInventory: inventory,
            actualFieldCount: (_) => 1,
            build: (data) => _CounterStyler(count.value(data)),
          ),
        ),
      ],
    );
    final protocol = MixProtocol.compose([
      mixProtocolCoreVocabulary,
      vocabulary,
    ]);

    inventory.add('future');

    expect(
      protocol.encodeStyle(const _CounterStyler(3)),
      isA<MixProtocolSuccess<JsonMap>>(),
    );
  });

  test('list codecs preserve nested double-token schema semantics', () {
    final values = MixProtocolField.direct<_NumberListStyler, List<double>>(
      wire: 'values',
      codec: MixProtocolCodecs.list(MixProtocolCodecs.number()),
      read: (value) => value.values,
    );
    final protocol = MixProtocol.compose([
      mixProtocolCoreVocabulary,
      MixProtocolVocabulary(
        id: 'number_lists',
        wireVersion: 1,
        branches: [
          MixProtocolStylerBranch<_NumberListStyler>(
            name: 'number_list',
            codec: (_) => MixProtocolStylerCodec(
              fields: [values],
              build: (data) => _NumberListStyler(values.value(data)),
            ),
          ),
        ],
      ),
    ]);
    final schema = protocol.exportStyleJsonSchema();
    final branch = (schema['anyOf']! as List<Object?>)
        .cast<JsonMap>()
        .singleWhere((branch) {
          final properties = branch['properties']! as JsonMap;
          final type = properties['type']! as JsonMap;

          return type['const'] == 'number_lists.v1.number_list';
        });
    final properties = branch['properties']! as JsonMap;
    final listSchema = properties['values']! as JsonMap;

    expect(listSchema['items'], {
      r'$ref': '#/definitions/mix_protocol_double_property_term',
    });
    expect(
      protocol.encodeStyle(
        _NumberListStyler([const DoubleToken('double.item')()]),
      ),
      isA<MixProtocolSuccess<JsonMap>>().having(
        (result) => result.value,
        'value',
        {
          'type': 'number_lists.v1.number_list',
          'values': [
            {r'$token': 'double.item', 'kind': 'double'},
          ],
          'v': 1,
        },
      ),
    );
  });

  test('nested list codecs repair the smallest invalid entry', () {
    final values =
        MixProtocolField.direct<_NestedListStyler, List<List<_Cell>>>(
          wire: 'values',
          codec: MixProtocolCodecs.list(
            MixProtocolCodecs.list(MixProtocolCodecs.enumName(_Cell.values)),
          ),
          read: (value) => value.values,
        );
    final protocol = MixProtocol.compose([
      mixProtocolCoreVocabulary,
      MixProtocolVocabulary(
        id: 'nested_lists',
        wireVersion: 1,
        branches: [
          MixProtocolStylerBranch<_NestedListStyler>(
            name: 'nested_list',
            codec: (_) => MixProtocolStylerCodec(
              fields: [values],
              build: (data) => _NestedListStyler(values.value(data)),
            ),
          ),
        ],
      ),
    ]);

    final result = protocol.decodeStyle<_NestedListStyler>({
      'v': 1,
      'type': 'nested_lists.v1.nested_list',
      'values': [
        ['alpha', 'future', 'beta'],
        ['alpha'],
      ],
    }, options: const MixProtocolDecodeOptions(mode: .lenient));

    expect(result, isA<MixProtocolSuccess<_NestedListStyler>>());
    final success = result as MixProtocolSuccess<_NestedListStyler>;
    expect(success.value.values, [
      [_Cell.alpha, _Cell.beta],
      [_Cell.alpha],
    ]);
    expect(success.warnings, hasLength(1));
    expect(success.warnings.single.path, '/values/0/1');
  });

  test('composite codecs describe every nested double-token position', () {
    final protocol = _compositeProtocol();
    final branch = (protocol.exportStyleJsonSchema()['anyOf']! as List)
        .cast<JsonMap>()
        .singleWhere((branch) {
          final properties = branch['properties']! as JsonMap;
          final type = properties['type']! as JsonMap;

          return type['const'] == 'composites.v1.composite';
        });
    final properties = branch['properties']! as JsonMap;
    const doubleTerm = '#/definitions/mix_protocol_double_property_term';
    const expectedPaths = <String, List<List<String>>>{
      'gradient': [
        ['radius'],
        ['focalRadius'],
        ['startAngle'],
        ['endAngle'],
      ],
      'border': [
        ['top', 'width'],
        ['top', 'strokeAlign'],
        ['right', 'width'],
        ['right', 'strokeAlign'],
        ['bottom', 'width'],
        ['bottom', 'strokeAlign'],
        ['left', 'width'],
        ['left', 'strokeAlign'],
      ],
      'borderSide': [
        ['width'],
        ['strokeAlign'],
      ],
      'edgeInsets': [
        [],
        ['left'],
        ['top'],
        ['right'],
        ['bottom'],
      ],
      'shadow': [
        ['blurRadius'],
      ],
    };

    for (final entry in expectedPaths.entries) {
      for (final path in entry.value) {
        expect(
          _schemaPathHasDirectRef(properties[entry.key], path, doubleTerm),
          isTrue,
          reason: '${entry.key}.${path.join('.')}',
        );
      }
    }

    expect(
      protocol.encodeStyle(
        _CompositeStyler(
          borderSide: BorderSideMix(width: const DoubleToken('side.width')()),
        ),
      ),
      isA<MixProtocolSuccess<JsonMap>>().having(
        (encoded) => encoded.value['borderSide'],
        'borderSide',
        {
          'width': {r'$token': 'side.width', 'kind': 'double'},
        },
      ),
    );
  });

  group('composition validation', () {
    test('requires the exact core vocabulary', () {
      final extension = _emptyVocabulary<_AlphaStyler>(
        id: 'alpha_styles',
        branchName: 'alpha',
        build: () => const _AlphaStyler(),
      );

      expect(() => MixProtocol.compose([extension]), throwsArgumentError);
      expect(
        () => MixProtocol.compose([
          mixProtocolCoreVocabulary,
          mixProtocolCoreVocabulary,
        ]),
        throwsArgumentError,
      );
    });

    test('rejects invalid and duplicate vocabulary ids', () {
      final valid = _emptyVocabulary<_AlphaStyler>(
        id: 'alpha_styles',
        branchName: 'alpha',
        build: () => const _AlphaStyler(),
      );
      final duplicate = _emptyVocabulary<_BetaStyler>(
        id: 'alpha_styles',
        branchName: 'beta',
        build: () => const _BetaStyler(),
      );
      final invalid = _emptyVocabulary<_BetaStyler>(
        id: 'Alpha.styles',
        branchName: 'beta',
        build: () => const _BetaStyler(),
      );

      expect(
        () =>
            MixProtocol.compose([mixProtocolCoreVocabulary, valid, duplicate]),
        throwsArgumentError,
      );
      expect(
        () => MixProtocol.compose([mixProtocolCoreVocabulary, invalid]),
        throwsArgumentError,
      );
    });

    test('rejects invalid versions, empty vocabularies, and branch names', () {
      final invalidVersion = MixProtocolVocabulary(
        id: 'alpha_styles',
        wireVersion: 0,
        branches: [
          _emptyBranch<_AlphaStyler>(
            name: 'alpha',
            build: () => const _AlphaStyler(),
          ),
        ],
      );
      final empty = MixProtocolVocabulary(
        id: 'empty_styles',
        wireVersion: 1,
        branches: const [],
      );
      final invalidBranch = _emptyVocabulary<_BetaStyler>(
        id: 'beta_styles',
        branchName: 'Beta.style',
        build: () => const _BetaStyler(),
      );

      for (final vocabulary in [invalidVersion, empty, invalidBranch]) {
        expect(
          () => MixProtocol.compose([mixProtocolCoreVocabulary, vocabulary]),
          throwsArgumentError,
        );
      }
    });

    test('rejects duplicate discriminators and runtime types', () {
      final duplicateDiscriminator = MixProtocolVocabulary(
        id: 'duplicate_styles',
        wireVersion: 1,
        branches: [
          _emptyBranch<_AlphaStyler>(
            name: 'same',
            build: () => const _AlphaStyler(),
          ),
          _emptyBranch<_BetaStyler>(
            name: 'same',
            build: () => const _BetaStyler(),
          ),
        ],
      );
      final alpha = _emptyVocabulary<_AlphaStyler>(
        id: 'alpha_styles',
        branchName: 'alpha',
        build: () => const _AlphaStyler(),
      );
      final repeatedType = _emptyVocabulary<_AlphaStyler>(
        id: 'other_styles',
        branchName: 'other',
        build: () => const _AlphaStyler(),
      );

      expect(
        () => MixProtocol.compose([
          mixProtocolCoreVocabulary,
          duplicateDiscriminator,
        ]),
        throwsArgumentError,
      );
      expect(
        () => MixProtocol.compose([
          mixProtocolCoreVocabulary,
          alpha,
          repeatedType,
        ]),
        throwsArgumentError,
      );
    });

    test('rejects reserved and invalid branch field names', () {
      for (final wire in ['v', 'type', r'$future', 'Future']) {
        final field = MixProtocolField.direct<_CounterStyler, int>(
          wire: wire,
          codec: MixProtocolCodecs.integer(),
          read: (value) => value.count,
        );
        final vocabulary = MixProtocolVocabulary(
          id: 'counter_styles',
          wireVersion: 1,
          branches: [
            MixProtocolStylerBranch<_CounterStyler>(
              name: 'counter',
              codec: (_) => MixProtocolStylerCodec(
                fields: [field],
                build: (data) => _CounterStyler(field.value(data)),
              ),
            ),
          ],
        );

        expect(
          () => MixProtocol.compose([mixProtocolCoreVocabulary, vocabulary]),
          throwsArgumentError,
          reason: wire,
        );
      }
    });

    test('rejects duplicate user and metadata field names', () {
      final first = MixProtocolField.direct<_CounterStyler, int>(
        wire: 'count',
        codec: MixProtocolCodecs.integer(),
        read: (value) => value.count,
      );
      final second = MixProtocolField.direct<_CounterStyler, int>(
        wire: 'count',
        codec: MixProtocolCodecs.integer(),
        read: (value) => value.count,
      );
      final duplicate = MixProtocolVocabulary(
        id: 'duplicate_fields',
        wireVersion: 1,
        branches: [
          MixProtocolStylerBranch<_CounterStyler>(
            name: 'counter',
            codec: (_) => MixProtocolStylerCodec(
              fields: [first, second],
              build: (data) => _CounterStyler(first.value(data)),
            ),
          ),
        ],
      );
      final metadataCollision = MixProtocolVocabulary(
        id: 'metadata_collision',
        wireVersion: 1,
        branches: [
          MixProtocolStylerBranch<_CounterStyler>(
            name: 'counter',
            codec: (context) {
              final variants = MixProtocolField.direct<_CounterStyler, int>(
                wire: 'variants',
                codec: MixProtocolCodecs.integer(),
                read: (value) => value.count,
              );
              final metadata =
                  MixProtocolStylerMetadata<_CounterStyler, BoxSpec>(
                    context: context,
                    readVariants: (_) => null,
                    readModifier: (_) => null,
                    readAnimation: (_) => null,
                  );

              return MixProtocolStylerCodec(
                fields: [variants],
                metadata: metadata,
                build: (data) => _CounterStyler(variants.value(data)),
              );
            },
          ),
        ],
      );

      for (final vocabulary in [duplicate, metadataCollision]) {
        expect(
          () => MixProtocol.compose([mixProtocolCoreVocabulary, vocabulary]),
          throwsArgumentError,
        );
      }
    });
  });
}

MixProtocolVocabulary _emptyVocabulary<T extends Object>({
  required String id,
  required String branchName,
  required T Function() build,
}) {
  return MixProtocolVocabulary(
    id: id,
    wireVersion: 1,
    branches: [_emptyBranch<T>(name: branchName, build: build)],
  );
}

MixProtocolStylerBranch<T> _emptyBranch<T extends Object>({
  required String name,
  required T Function() build,
}) {
  return MixProtocolStylerBranch<T>(
    name: name,
    codec: (_) =>
        MixProtocolStylerCodec<T>(fields: const [], build: (_) => build()),
  );
}

MixProtocol _compositeProtocol() {
  final gradient = MixProtocolField.direct<_CompositeStyler, GradientMix>(
    wire: 'gradient',
    codec: MixProtocolCodecs.gradient(),
    read: (value) => value.gradient,
  );
  final border = MixProtocolField.direct<_CompositeStyler, BorderMix>(
    wire: 'border',
    codec: MixProtocolCodecs.border(),
    read: (value) => value.border,
  );
  final borderSide = MixProtocolField.direct<_CompositeStyler, BorderSideMix>(
    wire: 'borderSide',
    codec: MixProtocolCodecs.borderSide(),
    read: (value) => value.borderSide,
  );
  final edgeInsets = MixProtocolField.direct<_CompositeStyler, EdgeInsetsMix>(
    wire: 'edgeInsets',
    codec: MixProtocolCodecs.edgeInsets(),
    read: (value) => value.edgeInsets,
  );
  final shadow = MixProtocolField.direct<_CompositeStyler, ShadowMix>(
    wire: 'shadow',
    codec: MixProtocolCodecs.shadow(),
    read: (value) => value.shadow,
  );

  return MixProtocol.compose([
    mixProtocolCoreVocabulary,
    MixProtocolVocabulary(
      id: 'composites',
      wireVersion: 1,
      branches: [
        MixProtocolStylerBranch<_CompositeStyler>(
          name: 'composite',
          codec: (_) => MixProtocolStylerCodec(
            fields: [gradient, border, borderSide, edgeInsets, shadow],
            build: (data) => _CompositeStyler(
              gradient: gradient.value(data),
              border: border.value(data),
              borderSide: borderSide.value(data),
              edgeInsets: edgeInsets.value(data),
              shadow: shadow.value(data),
            ),
          ),
        ),
      ],
    ),
  ]);
}

final class _CounterStyler {
  const _CounterStyler(this.count);

  final int? count;

  @override
  bool operator ==(Object other) =>
      other is _CounterStyler && other.count == count;

  @override
  int get hashCode => count.hashCode;
}

final class _AlphaStyler {
  const _AlphaStyler();
}

final class _BetaStyler {
  const _BetaStyler();
}

final class _NumberListStyler {
  const _NumberListStyler(this.values);

  final List<double>? values;
}

final class _NestedListStyler {
  const _NestedListStyler(this.values);

  final List<List<_Cell>>? values;
}

final class _CompositeStyler {
  const _CompositeStyler({
    this.gradient,
    this.border,
    this.borderSide,
    this.edgeInsets,
    this.shadow,
  });

  final GradientMix? gradient;
  final BorderMix? border;
  final BorderSideMix? borderSide;
  final EdgeInsetsMix? edgeInsets;
  final ShadowMix? shadow;
}

bool _schemaPathHasDirectRef(
  Object? schema,
  List<String> path,
  String reference,
) {
  if (schema is! Map) return false;
  final map = JsonMap.from(schema);
  final anyOf = map['anyOf'];
  if (anyOf is List &&
      anyOf.any((branch) => _schemaPathHasDirectRef(branch, path, reference))) {
    return true;
  }
  if (path.isEmpty) return map[r'$ref'] == reference;

  final properties = map['properties'];
  if (properties is! Map) return false;

  return _schemaPathHasDirectRef(
    properties[path.first],
    path.sublist(1),
    reference,
  );
}

enum _Cell { alpha, beta }
