import 'package:flutter/widgets.dart' show Clip;
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  test('Grid public API supports nested dot shorthand composition', () {
    final GridBoxStyler style = .columns([
      .fixed(220),
      .fr(2),
    ]).gap(16).onConstraints(.maxWidth(720), .columns([.fr(1)]).gap(8));

    expect(style.$columns, const [GridTrack.fixed(220), GridTrack.fr(2)]);
    expect(style.$columnGap, 16);
    expect(style.$rowGap, 16);
    expect(
      style.$constraintBranches!.single.breakpoint,
      const Breakpoint.maxWidth(720),
    );
    expect(style.$constraintBranches!.single.patch.columns, const [
      GridTrack.fr(1),
    ]);
    expect(style.$constraintBranches!.single.patch.columnGap, 8);
    expect(const GridBox(), isA<GridBox>());
  });

  test('Grid geometry factories expose the complete fluent surface', () {
    final GridBoxStyler geometry = .rows([
      .fixed(80),
    ]).autoRows(.fixed(120)).columnGap(4).rowGap(8).clipBehavior(.hardEdge);
    final GridBoxStyler constrained = .onConstraints(
      .maxHeight(480),
      .rows([.fixed(64)]),
    );

    expect(geometry.$rows, const [GridTrack.fixed(80)]);
    expect(geometry.$autoRows, const GridTrack.fixed(120));
    expect(geometry.$columnGap, 4);
    expect(geometry.$rowGap, 8);
    expect(geometry.$clipBehavior, Clip.hardEdge);
    expect(
      constrained.$constraintBranches!.single.breakpoint,
      const Breakpoint.maxHeight(480),
    );
  });
}
