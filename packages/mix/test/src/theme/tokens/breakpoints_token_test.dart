import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  test('MixBreakpointsTokens', () {
    final breakpoints = MixThemeData().breakpoints;

    final large = breakpoints[BreakpointToken.large]!;

    final medium = breakpoints[BreakpointToken.medium]!;
    final small = breakpoints[BreakpointToken.small]!;
    final xsmall = breakpoints[BreakpointToken.xsmall]!;

    expect(
      large,
      const Breakpoint(minWidth: 1440, maxWidth: double.infinity),
    );
    expect(medium, const Breakpoint(minWidth: 1024, maxWidth: 1439));
    expect(small, const Breakpoint(minWidth: 600, maxWidth: 1023));
    expect(xsmall, const Breakpoint(minWidth: 0, maxWidth: 599));
  });

  test('MixBreakpointsTokens large matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;

    final large = breakpoints[BreakpointToken.large]!;

    expect(large.matches(const Size(1440, 1024)), true);

    expect(large.matches(const Size(1439, 1024)), false);
  });

  test('MixBreakpointsTokens medium matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;

    final medium = breakpoints[BreakpointToken.medium]!;

    expect(medium.matches(const Size(1024, 1024)), true);

    expect(medium.matches(const Size(1023, 1024)), false);
  });

  test('MixBreakpointsTokens small matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;

    final small = breakpoints[BreakpointToken.small]!;

    expect(small.matches(const Size(600, 1024)), true);

    expect(small.matches(const Size(599, 1024)), false);
  });

  test('MixBreakpointsTokens xsmall matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;

    final xsmall = breakpoints[BreakpointToken.xsmall]!;

    expect(xsmall.matches(const Size(0, 1024)), true);

    expect(xsmall.matches(const Size(-1, 1024)), false);
  });

  testWidgets('BreakpointToken resolve returns correct Breakpoint',
      (tester) async {
    await tester.pumpWithMixTheme(Container());

    final context = tester.element(find.byType(Container));

    final themeData = MixTheme.of(context);
    expect(BreakpointToken.xsmall.resolve(context),
        themeData.breakpoints[BreakpointToken.xsmall]);
    expect(BreakpointToken.small.resolve(context),
        themeData.breakpoints[BreakpointToken.small]);
    expect(BreakpointToken.medium.resolve(context),
        themeData.breakpoints[BreakpointToken.medium]);
    expect(BreakpointToken.large.resolve(context),
        themeData.breakpoints[BreakpointToken.large]);
  });

  test('BreakpointResolver resolve returns correct Breakpoint', () {
    final context = MockBuildContext();
    const expectedBreakpoint = Breakpoint(minWidth: 100, maxWidth: 200);
    final resolver = BreakpointResolver((_) => expectedBreakpoint);

    expect(resolver.resolve(context), expectedBreakpoint);
  });

  test('BreakpointRef matches calls token resolve', () {
    const token = BreakpointToken('test.token');
    const ref = BreakpointRef(token);

    expect(ref.token, token);
  });
}
