import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix_chart/mix_chart.dart';
import 'package:mix_chart_protocol/mix_chart_protocol.dart';

void main() {
  final protocol = mixChartProtocol;

  test('ready-to-use chart protocol does not widen the core singleton', () {
    final style = LineChartStyler();

    expect(protocol.encodeStyle(style), isA<MixProtocolSuccess<JsonMap>>());
    expect(mixProtocol.encodeStyle(style), isA<MixProtocolFailure<JsonMap>>());
  });

  test('covers every public mix_chart styler', () {
    final expectedBranches = <String, Object>{
      'bar_background': BarBackgroundStyler(),
      'bar_chart': BarChartStyler(),
      'bar_segment': BarSegmentStyler(),
      'bar': BarStyler(),
      'chart_area': ChartAreaStyler(),
      'chart_axis': ChartAxisStyler(),
      'chart_frame': ChartFrameStyler(),
      'chart_grid': ChartGridStyler(),
      'chart_marker': ChartMarkerStyler(),
      'chart_stroke': ChartStrokeStyler(),
      'chart_tooltip': ChartTooltipStyler(),
      'line_chart': LineChartStyler(),
      'line_series': LineSeriesStyler(),
      'pie_chart': PieChartStyler(),
      'pie_slice': PieSliceStyler(),
    };

    expect(
      mixChartVocabulary.branches.map((branch) => branch.name).toSet(),
      expectedBranches.keys.toSet(),
    );

    for (final entry in expectedBranches.entries) {
      final encodedResult = protocol.encodeStyle(entry.value);
      expect(encodedResult, isA<MixProtocolSuccess<JsonMap>>());
      final encoded = (encodedResult as MixProtocolSuccess<JsonMap>).value;

      expect(encoded['type'], 'mix_chart.v1.${entry.key}');
      expect(
        protocol.decodeStyle<Object>(encoded),
        isA<MixProtocolSuccess<Object>>().having(
          (result) => result.value,
          'value',
          entry.value,
        ),
      );
    }
  });

  test('round-trips a line chart with nested chart and core stylers', () {
    final style = LineChartStyler()
        .axis(ChartAxisStyler.label(TextStyler.fontSize(11)))
        .grid(ChartGridStyler.stroke(ChartStrokeStyler.width(1)))
        .series(
          LineSeriesStyler.stroke(
            ChartStrokeStyler(
              color: const ColorToken('color.chart.line')(),
              width: 3,
            ),
          ),
        );

    final encoded = protocol.encodeStyle(style);
    expect(encoded, isA<MixProtocolSuccess<JsonMap>>());
    final payload = (encoded as MixProtocolSuccess<JsonMap>).value;
    expect(payload['type'], 'mix_chart.v1.line_chart');

    expect(
      protocol.decodeStyle<LineChartStyler>(payload),
      isA<MixProtocolSuccess<LineChartStyler>>().having(
        (result) => result.value,
        'value',
        style,
      ),
    );
  });

  test('canonicalizes ordinary Flutter values used by chart mix fields', () {
    final styles = <Object>[
      ChartFrameStyler(
        border: Border.all(color: const Color(0xff112233), width: 2),
      ),
      ChartMarkerStyler(
        shadow: ShadowMix(
          color: Color(0x66000000),
          offset: Offset(1, 2),
          blurRadius: 4,
        ),
      ),
      ChartMarkerStyler.create(
        shadow: Prop.value(
          const Shadow(
            color: Color(0x55000000),
            offset: Offset(2, 3),
            blurRadius: 5,
          ),
        ),
      ),
      ChartTooltipStyler(
        border: const BorderSide(color: Color(0xff445566), width: 1),
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.all(6),
      ),
      ChartStrokeStyler(
        gradient: const LinearGradient(
          colors: [Color(0xff112233), Color(0xff445566)],
        ),
      ),
      ChartStrokeStyler(dashArray: const []),
      BarStyler(
        gradient: const LinearGradient(
          colors: [Color(0xff778899), Color(0xffaabbcc)],
        ),
        borderRadius: BorderRadius.circular(4),
        border: const BorderSide(color: Color(0xff010203)),
      ),
      BarStyler(borderDashArray: const []),
    ];

    for (final style in styles) {
      final encodedResult = protocol.encodeStyle(style);
      expect(
        encodedResult,
        isA<MixProtocolSuccess<JsonMap>>(),
        reason: '$style',
      );
      final encoded = (encodedResult as MixProtocolSuccess<JsonMap>).value;
      final decodedResult = protocol.decodeStyle<Object>(encoded);
      expect(
        decodedResult,
        isA<MixProtocolSuccess<Object>>(),
        reason: '$style',
      );
      final decoded = (decodedResult as MixProtocolSuccess<Object>).value;

      expect(
        protocol.encodeStyle(decoded),
        isA<MixProtocolSuccess<JsonMap>>().having(
          (result) => result.value,
          'value',
          encoded,
        ),
      );
    }
  });

  test('ordinary Flutter encoding ignores global converter mutations', () {
    const border = Border.fromBorderSide(
      BorderSide(color: Color(0xff112233), width: 2),
    );
    final style = ChartFrameStyler(border: border);
    final before = protocol.encodeStyle(style);
    expect(before, isA<MixProtocolSuccess<JsonMap>>());
    final beforePayload = (before as MixProtocolSuccess<JsonMap>).value;

    final registry = MixConverterRegistry.instance;
    registry.tryConvert<Border>(border);
    final previous = registry.get<Border>()!;
    registry.register<Border>(const _HostileBorderConverter());
    try {
      expect(
        protocol.encodeStyle(style),
        isA<MixProtocolSuccess<JsonMap>>().having(
          (result) => result.value,
          'value',
          beforePayload,
        ),
      );
    } finally {
      registry.register<Border>(previous);
    }
  });

  test('enforces chart numeric boundaries', () {
    for (final style in <Object>[
      ChartTooltipStyler(maxWidth: 0),
      ChartStrokeStyler(opacity: 0),
      ChartStrokeStyler(opacity: 1),
      ChartGridStyler(horizontalInterval: 0.1),
      ChartMarkerStyler(radius: 0),
    ]) {
      expect(
        protocol.encodeStyle(style),
        isA<MixProtocolSuccess<JsonMap>>(),
        reason: '$style',
      );
    }

    for (final style in <Object>[
      ChartStrokeStyler(opacity: 1.1),
      ChartGridStyler(horizontalInterval: 0),
      ChartMarkerStyler(radius: -1),
      ChartStrokeStyler(dashArray: const [0]),
      ChartAreaStyler(cutoffY: double.nan),
    ]) {
      expect(
        protocol.encodeStyle(style),
        isA<MixProtocolFailure<JsonMap>>(),
        reason: '$style',
      );
    }
  });

  test('reports a wrong known nested style at the chart field', () {
    final result = protocol.decodeStyle<ChartAxisStyler>({
      'v': 1,
      'type': 'mix_chart.v1.chart_axis',
      'label': {'type': 'box', 'padding': 4},
    });

    expect(result, isA<MixProtocolFailure<ChartAxisStyler>>());
    final failure = result as MixProtocolFailure<ChartAxisStyler>;
    expect(failure.errors, hasLength(1));
    expect(failure.errors.single.code, MixProtocolErrorCode.typeMismatch);
    expect(failure.errors.single.path, '/label');
  });

  test('round-trips extension variants, modifiers, and animation', () {
    final style = ChartStrokeStyler(
      width: 2,
      variants: [
        VariantStyle(
          const NamedVariant('muted'),
          ChartStrokeStyler(opacity: 0.5),
        ),
      ],
      modifier: WidgetModifierConfig.opacity(0.75),
      animation: CurveAnimationConfig.easeInOut(
        const Duration(milliseconds: 120),
      ),
    );

    final encoded = protocol.encodeStyle(style);
    expect(encoded, isA<MixProtocolSuccess<JsonMap>>());
    final payload = (encoded as MixProtocolSuccess<JsonMap>).value;

    expect(
      protocol.decodeStyle<ChartStrokeStyler>(payload),
      isA<MixProtocolSuccess<ChartStrokeStyler>>().having(
        (result) => result.value,
        'value',
        style,
      ),
    );
  });

  test('keeps canonical wire stable for every populated chart branch', () {
    final gradient = const LinearGradient(
      colors: [Color(0xff112233), Color(0xff445566)],
    );
    final borderSide = const BorderSide(color: Color(0xff778899), width: 2);
    final styles = <Object>[
      BarBackgroundStyler(
        show: true,
        fromY: -4,
        toY: 8,
        color: const Color(0xff102030),
        gradient: gradient,
      ),
      BarChartStyler(
        frame: ChartFrameStyler(showBorder: true),
        axis: ChartAxisStyler(showLabels: true),
        xAxis: ChartAxisStyler(labelSpace: 4),
        yAxis: ChartAxisStyler(reservedSize: 24),
        topAxis: ChartAxisStyler(fitInside: true),
        rightAxis: ChartAxisStyler(drawBelowEverything: false),
        grid: ChartGridStyler(show: true),
        bar: BarStyler(width: 12),
        segment: BarSegmentStyler(color: const Color(0xff203040)),
        palette: const [Color(0xff304050), Color(0xff405060)],
        groupSpacing: 8,
        barSpacing: 2,
        alignment: BarAlignment.values.first,
        tooltip: ChartTooltipStyler(margin: 6),
      ),
      BarSegmentStyler(
        color: const Color(0xff506070),
        gradient: gradient,
        border: borderSide,
        label: TextStyler(maxLines: 1),
      ),
      BarStyler(
        color: const Color(0xff607080),
        gradient: gradient,
        width: 16,
        borderRadius: BorderRadius.circular(5),
        border: borderSide,
        borderDashArray: const [2, 4],
        background: BarBackgroundStyler(show: true),
        label: TextStyler.fontSize(11),
        labelOffset: const Offset(1, 2),
        labelAngle: 0.25,
      ),
      ChartAreaStyler(
        show: true,
        color: const Color(0xff708090),
        gradient: gradient,
        cutoffY: -1,
        applyCutoff: true,
      ),
      ChartAxisStyler(
        showLabels: true,
        label: TextStyler.fontSize(10),
        reservedSize: 30,
        labelSpace: 5,
        labelAngle: 0.5,
        fitInside: true,
        fitInsideDistance: 3,
        nameSize: 12,
        drawBelowEverything: false,
        alignment: ChartAxisLabelAlignment.values.first,
      ),
      ChartFrameStyler(
        backgroundColor: const Color(0xff8090a0),
        border: Border.all(color: const Color(0xff90a0b0)),
        showBorder: true,
        clip: true,
        rotationQuarterTurns: 1,
      ),
      ChartGridStyler(
        show: true,
        showHorizontal: true,
        showVertical: false,
        horizontalInterval: 2,
        verticalInterval: 4,
        stroke: ChartStrokeStyler(width: 1),
      ),
      ChartMarkerStyler(
        show: true,
        shape: ChartMarkerShape.values.first,
        color: const Color(0xffa0b0c0),
        radius: 5,
        borderColor: const Color(0xffb0c0d0),
        borderWidth: 1,
        shadow: ShadowMix(
          color: const Color(0x44000000),
          offset: const Offset(1, 1),
          blurRadius: 3,
        ),
      ),
      ChartStrokeStyler(
        color: const Color(0xffc0d0e0),
        gradient: gradient,
        width: 3,
        dashArray: const [3, 2],
        opacity: 0.8,
      ),
      ChartTooltipStyler(
        backgroundColor: const Color(0xffd0e0f0),
        border: borderSide,
        borderRadius: BorderRadius.circular(6),
        padding: const EdgeInsets.all(8),
        margin: 4,
        maxWidth: 240,
        fitHorizontally: true,
        fitVertically: false,
        text: TextStyler(maxLines: 2),
      ),
      LineChartStyler(
        frame: ChartFrameStyler(clip: true),
        axis: ChartAxisStyler(showLabels: true),
        xAxis: ChartAxisStyler(labelSpace: 2),
        yAxis: ChartAxisStyler(reservedSize: 20),
        topAxis: ChartAxisStyler(showLabels: false),
        rightAxis: ChartAxisStyler(fitInside: true),
        grid: ChartGridStyler(show: true),
        series: LineSeriesStyler(show: true),
        palette: const [Color(0xffe0f001)],
        tooltip: ChartTooltipStyler(maxWidth: 180),
      ),
      LineSeriesStyler(
        show: true,
        stroke: ChartStrokeStyler(width: 2),
        curve: LineCurve.values.first,
        smoothness: 0.4,
        preventCurveOvershooting: true,
        curveOvershootingThreshold: 3,
        roundStrokeCap: true,
        roundStrokeJoin: false,
        marker: ChartMarkerStyler(radius: 4),
        belowArea: ChartAreaStyler(show: true),
        aboveArea: ChartAreaStyler(show: false),
        shadow: ShadowMix(blurRadius: 2),
      ),
      PieChartStyler(
        frame: ChartFrameStyler(showBorder: true),
        slice: PieSliceStyler(radius: 80),
        selectedSliceRadiusOffset: 6,
        palette: const [Color(0xfff00112), Color(0xff011223)],
        centerRadius: 30,
        centerColor: const Color(0xff122334),
        sliceSpacing: 2,
        startAngle: -1.5,
        sunbeamLabels: true,
        tooltip: ChartTooltipStyler(margin: 3),
      ),
      PieSliceStyler(
        color: const Color(0xff233445),
        gradient: gradient,
        radius: 90,
        showLabel: true,
        label: TextStyler.fontSize(12),
        labelPosition: 0.7,
        border: borderSide,
        cornerRadius: 4,
        badgePosition: 0.9,
      ),
    ];
    final encodedDocuments = <JsonMap>[];

    for (final style in styles) {
      final encodedResult = protocol.encodeStyle(style);
      if (encodedResult case MixProtocolFailure<JsonMap>(:final errors)) {
        fail('$style failed to encode: $errors');
      }
      final encoded = (encodedResult as MixProtocolSuccess<JsonMap>).value;
      encodedDocuments.add(encoded);
      final decodedResult = protocol.decodeStyle<Object>(encoded);
      if (decodedResult case MixProtocolFailure<Object>(:final errors)) {
        fail('$style failed to decode: $errors');
      }
      final decoded = (decodedResult as MixProtocolSuccess<Object>).value;

      expect(
        protocol.encodeStyle(decoded),
        isA<MixProtocolSuccess<JsonMap>>().having(
          (result) => result.value,
          'value',
          encoded,
        ),
        reason: style.runtimeType.toString(),
      );
    }

    expect(
      _fnv1a64(utf8.encode(jsonEncode(encodedDocuments))),
      1359520337547690977,
      reason: 'Changing this fingerprint changes the declared chart v1 wire.',
    );
  });

  test('lenient mode derives extension list repair from field semantics', () {
    final payload = <String, Object?>{
      'v': 1,
      'type': 'mix_chart.v1.line_chart',
      'palette': [
        {r'$token': 'color.chart.primary'},
        {r'$token': 'color.chart.future', 'kind': 'future'},
      ],
    };

    final result = protocol.decodeStyle<LineChartStyler>(
      payload,
      options: const MixProtocolDecodeOptions(
        mode: MixProtocolDecodeMode.lenient,
      ),
    );

    if (result case MixProtocolFailure<LineChartStyler>(:final errors)) {
      fail('errors: $errors; warnings: ${result.warnings}');
    }
    expect(result, isA<MixProtocolSuccess<LineChartStyler>>());
    final success = result as MixProtocolSuccess<LineChartStyler>;
    expect(success.warnings, hasLength(1));
    expect(success.warnings.single.path, '/palette/1/kind');
    expect(
      protocol.encodeStyle(success.value),
      isA<MixProtocolSuccess<JsonMap>>().having(
        (encoded) => encoded.value,
        'value',
        {
          'type': 'mix_chart.v1.line_chart',
          'palette': [
            {r'$token': 'color.chart.primary'},
          ],
          'v': 1,
        },
      ),
    );
  });

  test('declares the chart vocabulary in exported schema metadata', () {
    final schema = protocol.exportStyleJsonSchema();

    expect(
      _fnv1a64(utf8.encode(jsonEncode(schema))),
      4689672354660132275,
      reason: 'Changing this fingerprint changes the declared chart v1 schema.',
    );

    expect(schema['x-mix-protocol-vocabularies'], [
      {'id': 'mix_chart', 'wireVersion': 1},
    ]);
    final chartBranches = <String, Map<String, Object?>>{
      for (final branch in _branches(schema))
        if (_branchType(branch).startsWith('mix_chart.'))
          _branchType(branch): branch,
    };
    expect(chartBranches.keys.toSet(), {
      for (final branch in mixChartVocabulary.branches)
        'mix_chart.v1.${branch.name}',
    });
    expect(_properties(chartBranches['mix_chart.v1.chart_stroke']!)['width'], {
      r'$ref': '#/definitions/mix_protocol_double_property_term',
    });
  });
}

int _fnv1a64(List<int> bytes) {
  var hash = 0xcbf29ce484222325;
  for (final byte in bytes) {
    hash ^= byte;
    hash = (hash * 0x100000001b3) & 0xffffffffffffffff;
  }

  return hash;
}

final class _HostileBorderConverter implements MixConverter<Border> {
  const _HostileBorderConverter();

  @override
  Mix<Border> toMix(Border value, ConversionContext context) {
    return BorderMix.value(
      Border.all(color: const Color(0xffff0000), width: 99),
    );
  }
}

List<Map<String, Object?>> _branches(Map<String, Object?> schema) {
  return (schema['anyOf']! as List<Object?>).cast<Map<String, Object?>>();
}

String _branchType(Map<String, Object?> branch) {
  return (_properties(branch)['type']! as Map<String, Object?>)['const']!
      as String;
}

Map<String, Object?> _properties(Map<String, Object?> branch) {
  return (branch['properties']! as Map<Object?, Object?>).cast();
}
