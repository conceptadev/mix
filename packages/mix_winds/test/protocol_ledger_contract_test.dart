import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_schema/json_schema.dart' as json_schema;
import 'package:mix/mix.dart';
import 'package:mix_protocol/mix_protocol.dart';
import 'package:mix_winds/mix_winds.dart';
import 'package:mix_winds/src/parser/data/compatibility_ledger.g.dart';

enum _Target { box, flex, text, icon }

typedef _Case = ({
  String root,
  TailwindRegistryRootKind kind,
  _Target target,
  String classes,
  bool runtime,
});

// Each row declares a representative independently of the generated ledger.
// A ledger change must add or review the corresponding contract case.
const _utilities = <_Case>[
  (
    root: 'basis-auto',
    kind: .staticUtility,
    target: .box,
    classes: 'basis-auto',
    runtime: false,
  ),
  (
    root: 'capitalize',
    kind: .staticUtility,
    target: .text,
    classes: 'capitalize',
    runtime: false,
  ),
  (
    root: 'flex',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex',
    runtime: false,
  ),
  (
    root: 'flex-auto',
    kind: .staticUtility,
    target: .box,
    classes: 'flex-auto',
    runtime: true,
  ),
  (
    root: 'flex-col',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex flex-col',
    runtime: true,
  ),
  (
    root: 'flex-initial',
    kind: .staticUtility,
    target: .box,
    classes: 'flex-initial',
    runtime: true,
  ),
  (
    root: 'flex-none',
    kind: .staticUtility,
    target: .box,
    classes: 'flex-none',
    runtime: true,
  ),
  (
    root: 'flex-row',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex flex-row',
    runtime: false,
  ),
  (
    root: 'h-auto',
    kind: .staticUtility,
    target: .box,
    classes: 'h-auto',
    runtime: false,
  ),
  (
    root: 'h-screen',
    kind: .staticUtility,
    target: .box,
    classes: 'h-screen',
    runtime: true,
  ),
  (
    root: 'inline-flex',
    kind: .staticUtility,
    target: .flex,
    classes: 'inline-flex',
    runtime: false,
  ),
  (
    root: 'items-baseline',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex items-baseline',
    runtime: false,
  ),
  (
    root: 'items-center',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex items-center',
    runtime: false,
  ),
  (
    root: 'items-end',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex items-end',
    runtime: false,
  ),
  (
    root: 'items-start',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex items-start',
    runtime: false,
  ),
  (
    root: 'items-stretch',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex items-stretch',
    runtime: false,
  ),
  (
    root: 'justify-around',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex justify-around',
    runtime: false,
  ),
  (
    root: 'justify-between',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex justify-between',
    runtime: false,
  ),
  (
    root: 'justify-center',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex justify-center',
    runtime: false,
  ),
  (
    root: 'justify-end',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex justify-end',
    runtime: false,
  ),
  (
    root: 'justify-evenly',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex justify-evenly',
    runtime: false,
  ),
  (
    root: 'justify-start',
    kind: .staticUtility,
    target: .flex,
    classes: 'flex justify-start',
    runtime: false,
  ),
  (
    root: 'lowercase',
    kind: .staticUtility,
    target: .text,
    classes: 'lowercase',
    runtime: false,
  ),
  (
    root: 'min-h-screen',
    kind: .staticUtility,
    target: .box,
    classes: 'min-h-screen',
    runtime: true,
  ),
  (
    root: 'min-w-screen',
    kind: .staticUtility,
    target: .box,
    classes: 'min-w-screen',
    runtime: true,
  ),
  (
    root: 'overflow-clip',
    kind: .staticUtility,
    target: .box,
    classes: 'overflow-clip',
    runtime: false,
  ),
  (
    root: 'overflow-hidden',
    kind: .staticUtility,
    target: .box,
    classes: 'overflow-hidden',
    runtime: false,
  ),
  (
    root: 'overflow-visible',
    kind: .staticUtility,
    target: .box,
    classes: 'overflow-visible',
    runtime: false,
  ),
  (
    root: 'self-center',
    kind: .staticUtility,
    target: .box,
    classes: 'self-center',
    runtime: true,
  ),
  (
    root: 'self-end',
    kind: .staticUtility,
    target: .box,
    classes: 'self-end',
    runtime: true,
  ),
  (
    root: 'self-start',
    kind: .staticUtility,
    target: .box,
    classes: 'self-start',
    runtime: true,
  ),
  (
    root: 'text-center',
    kind: .staticUtility,
    target: .text,
    classes: 'text-center',
    runtime: false,
  ),
  (
    root: 'text-end',
    kind: .staticUtility,
    target: .text,
    classes: 'text-end',
    runtime: false,
  ),
  (
    root: 'text-justify',
    kind: .staticUtility,
    target: .text,
    classes: 'text-justify',
    runtime: false,
  ),
  (
    root: 'text-left',
    kind: .staticUtility,
    target: .text,
    classes: 'text-left',
    runtime: false,
  ),
  (
    root: 'text-right',
    kind: .staticUtility,
    target: .text,
    classes: 'text-right',
    runtime: false,
  ),
  (
    root: 'text-start',
    kind: .staticUtility,
    target: .text,
    classes: 'text-start',
    runtime: false,
  ),
  (
    root: 'truncate',
    kind: .staticUtility,
    target: .text,
    classes: 'truncate',
    runtime: false,
  ),
  (
    root: 'uppercase',
    kind: .staticUtility,
    target: .text,
    classes: 'uppercase',
    runtime: false,
  ),
  (
    root: 'w-auto',
    kind: .staticUtility,
    target: .box,
    classes: 'w-auto',
    runtime: false,
  ),
  (
    root: 'w-screen',
    kind: .staticUtility,
    target: .box,
    classes: 'w-screen',
    runtime: true,
  ),
  (
    root: 'basis',
    kind: .functionalUtility,
    target: .box,
    classes: 'basis-4',
    runtime: true,
  ),
  (
    root: 'bg',
    kind: .functionalUtility,
    target: .box,
    classes: 'bg-blue-500',
    runtime: false,
  ),
  (
    root: 'bg-gradient',
    kind: .functionalUtility,
    target: .box,
    classes: 'bg-gradient-to-r from-red-500 to-blue-500',
    runtime: false,
  ),
  (
    root: 'bg-linear',
    kind: .functionalUtility,
    target: .box,
    classes: 'bg-linear-to-r from-red-500 to-blue-500',
    runtime: false,
  ),
  (
    root: 'blur',
    kind: .functionalUtility,
    target: .box,
    classes: 'blur-sm',
    runtime: false,
  ),
  (
    root: 'border',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-2',
    runtime: false,
  ),
  (
    root: 'border-b',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-b-2',
    runtime: false,
  ),
  (
    root: 'border-l',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-l-2',
    runtime: false,
  ),
  (
    root: 'border-r',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-r-2',
    runtime: false,
  ),
  (
    root: 'border-t',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-t-2',
    runtime: false,
  ),
  (
    root: 'border-x',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-x-2',
    runtime: false,
  ),
  (
    root: 'border-y',
    kind: .functionalUtility,
    target: .box,
    classes: 'border-y-2',
    runtime: false,
  ),
  (
    root: 'delay',
    kind: .functionalUtility,
    target: .box,
    classes: 'transition-all delay-100',
    runtime: false,
  ),
  (
    root: 'duration',
    kind: .functionalUtility,
    target: .box,
    classes: 'transition-all duration-200',
    runtime: false,
  ),
  (
    root: 'ease',
    kind: .functionalUtility,
    target: .box,
    classes: 'transition-all ease-in-out',
    runtime: false,
  ),
  (
    root: 'flex',
    kind: .functionalUtility,
    target: .box,
    classes: 'flex-1',
    runtime: true,
  ),
  (
    root: 'font',
    kind: .functionalUtility,
    target: .text,
    classes: 'font-bold',
    runtime: false,
  ),
  (
    root: 'from',
    kind: .functionalUtility,
    target: .box,
    classes: 'bg-gradient-to-r from-red-500 to-blue-500 from-red-500',
    runtime: false,
  ),
  (
    root: 'gap',
    kind: .functionalUtility,
    target: .flex,
    classes: 'flex gap-4',
    runtime: false,
  ),
  (
    root: 'gap-x',
    kind: .functionalUtility,
    target: .flex,
    classes: 'flex gap-x-4',
    runtime: true,
  ),
  (
    root: 'gap-y',
    kind: .functionalUtility,
    target: .flex,
    classes: 'flex gap-y-4',
    runtime: true,
  ),
  (
    root: 'grow',
    kind: .functionalUtility,
    target: .box,
    classes: 'grow',
    runtime: true,
  ),
  (
    root: 'h',
    kind: .functionalUtility,
    target: .box,
    classes: 'h-8',
    runtime: false,
  ),
  (
    root: 'leading',
    kind: .functionalUtility,
    target: .text,
    classes: 'leading-tight',
    runtime: false,
  ),
  (
    root: 'm',
    kind: .functionalUtility,
    target: .box,
    classes: 'm-4',
    runtime: true,
  ),
  (
    root: 'max-h',
    kind: .functionalUtility,
    target: .box,
    classes: 'max-h-4',
    runtime: false,
  ),
  (
    root: 'max-w',
    kind: .functionalUtility,
    target: .box,
    classes: 'max-w-4',
    runtime: false,
  ),
  (
    root: 'mb',
    kind: .functionalUtility,
    target: .box,
    classes: 'mb-4',
    runtime: true,
  ),
  (
    root: 'min-h',
    kind: .functionalUtility,
    target: .box,
    classes: 'min-h-4',
    runtime: false,
  ),
  (
    root: 'min-w',
    kind: .functionalUtility,
    target: .box,
    classes: 'min-w-4',
    runtime: false,
  ),
  (
    root: 'ml',
    kind: .functionalUtility,
    target: .box,
    classes: 'ml-4',
    runtime: true,
  ),
  (
    root: 'mr',
    kind: .functionalUtility,
    target: .box,
    classes: 'mr-4',
    runtime: true,
  ),
  (
    root: 'mt',
    kind: .functionalUtility,
    target: .box,
    classes: 'mt-4',
    runtime: true,
  ),
  (
    root: 'mx',
    kind: .functionalUtility,
    target: .box,
    classes: 'mx-4',
    runtime: true,
  ),
  (
    root: 'my',
    kind: .functionalUtility,
    target: .box,
    classes: 'my-4',
    runtime: true,
  ),
  (
    root: 'opacity',
    kind: .functionalUtility,
    target: .box,
    classes: 'opacity-50',
    runtime: false,
  ),
  (
    root: 'p',
    kind: .functionalUtility,
    target: .box,
    classes: 'p-4',
    runtime: false,
  ),
  (
    root: 'pb',
    kind: .functionalUtility,
    target: .box,
    classes: 'pb-4',
    runtime: false,
  ),
  (
    root: 'pl',
    kind: .functionalUtility,
    target: .box,
    classes: 'pl-4',
    runtime: false,
  ),
  (
    root: 'pr',
    kind: .functionalUtility,
    target: .box,
    classes: 'pr-4',
    runtime: false,
  ),
  (
    root: 'pt',
    kind: .functionalUtility,
    target: .box,
    classes: 'pt-4',
    runtime: false,
  ),
  (
    root: 'px',
    kind: .functionalUtility,
    target: .box,
    classes: 'px-4',
    runtime: false,
  ),
  (
    root: 'py',
    kind: .functionalUtility,
    target: .box,
    classes: 'py-4',
    runtime: false,
  ),
  (
    root: 'rotate',
    kind: .functionalUtility,
    target: .box,
    classes: 'rotate-45',
    runtime: false,
  ),
  (
    root: 'rounded',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-md',
    runtime: false,
  ),
  (
    root: 'rounded-b',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-b-md',
    runtime: false,
  ),
  (
    root: 'rounded-bl',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-bl-md',
    runtime: false,
  ),
  (
    root: 'rounded-br',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-br-md',
    runtime: false,
  ),
  (
    root: 'rounded-l',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-l-md',
    runtime: false,
  ),
  (
    root: 'rounded-r',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-r-md',
    runtime: false,
  ),
  (
    root: 'rounded-t',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-t-md',
    runtime: false,
  ),
  (
    root: 'rounded-tl',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-tl-md',
    runtime: false,
  ),
  (
    root: 'rounded-tr',
    kind: .functionalUtility,
    target: .box,
    classes: 'rounded-tr-md',
    runtime: false,
  ),
  (
    root: 'scale',
    kind: .functionalUtility,
    target: .box,
    classes: 'scale-105',
    runtime: false,
  ),
  (
    root: 'shadow',
    kind: .functionalUtility,
    target: .box,
    classes: 'shadow-md',
    runtime: false,
  ),
  (
    root: 'shrink',
    kind: .functionalUtility,
    target: .box,
    classes: 'shrink',
    runtime: true,
  ),
  (
    root: 'text',
    kind: .functionalUtility,
    target: .text,
    classes: 'text-lg',
    runtime: false,
  ),
  (
    root: 'text-shadow',
    kind: .functionalUtility,
    target: .text,
    classes: 'text-shadow-sm',
    runtime: false,
  ),
  (
    root: 'to',
    kind: .functionalUtility,
    target: .box,
    classes: 'bg-gradient-to-r from-red-500 to-blue-500 to-blue-500',
    runtime: false,
  ),
  (
    root: 'tracking',
    kind: .functionalUtility,
    target: .text,
    classes: 'tracking-wide',
    runtime: false,
  ),
  (
    root: 'transition',
    kind: .functionalUtility,
    target: .box,
    classes: 'transition-all',
    runtime: false,
  ),
  (
    root: 'translate-x',
    kind: .functionalUtility,
    target: .box,
    classes: 'translate-x-4',
    runtime: false,
  ),
  (
    root: 'translate-y',
    kind: .functionalUtility,
    target: .box,
    classes: 'translate-y-4',
    runtime: false,
  ),
  (
    root: 'via',
    kind: .functionalUtility,
    target: .box,
    classes: 'bg-gradient-to-r from-red-500 to-blue-500 via-white',
    runtime: false,
  ),
  (
    root: 'w',
    kind: .functionalUtility,
    target: .box,
    classes: 'w-8',
    runtime: true,
  ),
];

const _variants = [
  '2xl',
  'active',
  'dark',
  'disabled',
  'enabled',
  'focus',
  'focus-visible',
  'hover',
  'lg',
  'light',
  'md',
  'sm',
  'xl',
  'not',
];

void main() {
  final parser = TwParser();
  late final validator = json_schema.JsonSchema.create(
    mixProtocol.exportStyleJsonSchema(),
  );

  test('the protocol matrix covers each supported ledger family', () {
    bool supported(TailwindCompatibilityEntry entry) =>
        entry.status == .implemented || entry.status == .adapted;
    expect(
      {for (final entry in _utilities) (entry.kind, entry.root)},
      {
        for (final entry in generatedTailwindUtilityCompatibilityLedger.where(
          supported,
        ))
          (entry.kind, entry.root),
      },
    );
    expect(
      _utilities.map((entry) => (entry.kind, entry.root)).toSet(),
      hasLength(_utilities.length),
    );
    expect(_variants.toSet(), {
      for (final entry in generatedTailwindVariantCompatibilityLedger.where(
        supported,
      ))
        entry.root,
    });
  });

  for (final entry in _utilities) {
    testWidgets('${entry.kind.name}/${entry.root} preserves its style', (
      tester,
    ) async {
      final compilation = _compile(parser, entry.target, entry.classes);
      expect(compilation.diagnostics, isEmpty, reason: entry.classes);
      expect(
        compilation.requiresWidgetRuntime,
        entry.runtime,
        reason: entry.classes,
      );
      final decoded = _roundTrip(compilation.styler, validator, entry.classes);
      await _checkContexts(tester, compilation.styler, decoded);
    });
  }

  for (final variant in _variants) {
    for (final target in _Target.values) {
      testWidgets(
        '$variant/${target.name} preserves active and inactive styles',
        (tester) async {
          final prefix = variant == 'not' ? 'not-hover' : variant;
          final utility = switch (target) {
            _Target.box || _Target.flex => 'bg-blue-500',
            _Target.text || _Target.icon => 'text-blue-500',
          };
          final classes =
              '${target == _Target.flex ? 'flex ' : ''}$prefix:$utility';
          final compilation = _compile(parser, target, classes);
          if (target == _Target.icon) {
            expect(
              compilation.diagnostics.map((diagnostic) => diagnostic.code),
              [TwDiagnosticCode.unsupportedForTarget],
              reason: classes,
            );
          } else {
            expect(compilation.diagnostics, isEmpty, reason: classes);
          }
          expect(compilation.requiresWidgetRuntime, isFalse, reason: classes);
          final decoded = _roundTrip(compilation.styler, validator, classes);
          await _checkContexts(tester, compilation.styler, decoded);
        },
      );
    }
  }
}

TwCompilation<Object> _compile(
  TwParser parser,
  _Target target,
  String classes,
) => switch (target) {
  _Target.box => parser.compileBox(classes),
  _Target.flex => parser.compileFlex(classes),
  _Target.text => parser.compileText(classes),
  _Target.icon => parser.compileIcon(classes),
};

Object _roundTrip(
  Object style,
  json_schema.JsonSchema validator,
  String label,
) {
  final encoded = _encode(style);
  final validation = validator.validate(encoded);
  expect(validation.isValid, isTrue, reason: '$label: ${validation.errors}');
  final decoded = switch (mixProtocol.decodeStyle<Object>(encoded)) {
    MixProtocolSuccess<Object>(:final value, :final warnings)
        when warnings.isEmpty =>
      value,
    final result => throw TestFailure('$label: $result'),
  };
  expect(_encode(decoded), encoded, reason: label);
  return decoded;
}

JsonMap _encode(Object style) => switch (mixProtocol.encodeStyle(style)) {
  MixProtocolSuccess<JsonMap>(:final value) => value,
  MixProtocolFailure<JsonMap>(:final errors) => throw TestFailure('$errors'),
};

Object _resolve(Object style, BuildContext context) => switch (style) {
  BoxStyler() => style.build(context),
  FlexBoxStyler() => style.build(context),
  TextStyler() => style.build(context),
  IconStyler() => style.build(context),
  _ => throw TestFailure('Unexpected style ${style.runtimeType}'),
};

Future<void> _checkContexts(
  WidgetTester tester,
  Object original,
  Object decoded,
) async {
  for (final width in [480.0, 640.0, 768.0, 1024.0, 1280.0, 1536.0]) {
    for (final active in [false, true]) {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: MediaQueryData(
              size: Size(width, 900),
              platformBrightness: active ? Brightness.dark : Brightness.light,
            ),
            child: WidgetStateStyleOverride(
              states: {
                if (active) ...[
                  WidgetState.hovered,
                  WidgetState.focused,
                  WidgetState.pressed,
                  WidgetState.disabled,
                ],
              },
              child: Builder(
                builder: (context) {
                  expect(
                    _resolve(decoded, context),
                    _resolve(original, context),
                    reason:
                        '${original.runtimeType}: width=$width, active=$active',
                  );
                  return const SizedBox();
                },
              ),
            ),
          ),
        ),
      );
    }
  }
}
