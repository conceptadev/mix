import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  test('MixBreakpointsTokens', () {
    const tokens = MixBreakpointsTokens();

    expect(tokens.large, 1440);
    expect(tokens.medium, 1240);
    expect(tokens.small, 600);
    expect(tokens.xsmall, 0);
  });

  test('MixBreakpointsTokens.raw', () {
    const tokens = MixBreakpointsTokens.raw(
      large: 100,
      medium: 200,
      small: 300,
      xsmall: 400,
    );

    expect(tokens.large, 100);
    expect(tokens.medium, 200);
    expect(tokens.small, 300);
    expect(tokens.xsmall, 400);
  });

  test('MixBreakpointsTokens.copyWith', () {
    const tokens = MixBreakpointsTokens.raw(
      large: 100,
      medium: 200,
      small: 300,
      xsmall: 400,
    );

    final copy = tokens.copyWith(
      large: 1000,
      medium: 2000,
      small: 3000,
      xsmall: 4000,
    );

    expect(copy.large, 1000);
    expect(copy.medium, 2000);
    expect(copy.small, 3000);
    expect(copy.xsmall, 4000);
  });

  testWidgets(
      'MixBreakpointsTokens getScreenSize returns xsmall for small screens',
      (tester) async {
    const tokens = MixBreakpointsTokens();
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(100, 100)),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return Container();
            },
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(Container));

    expect(tokens.getScreenSize(context), ScreenSizeToken.xsmall);
  });

  // For small screens
  testWidgets(
      'MixBreakpointsTokens getScreenSize returns small for small screens',
      (tester) async {
    const tokens = MixBreakpointsTokens();
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(600, 100)),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return Container();
            },
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(Container));

    expect(tokens.getScreenSize(context), ScreenSizeToken.small);
  });

  // For medium screens
  testWidgets(
      'MixBreakpointsTokens getScreenSize returns medium for medium screens',
      (tester) async {
    const tokens = MixBreakpointsTokens();
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1240, 100)),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return Container();
            },
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(Container));

    expect(tokens.getScreenSize(context), ScreenSizeToken.medium);
  });

  // For large screens
  testWidgets(
      'MixBreakpointsTokens getScreenSize returns large for large screens',
      (tester) async {
    const tokens = MixBreakpointsTokens();
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1440, 100)),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return Container();
            },
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(Container));

    expect(tokens.getScreenSize(context), ScreenSizeToken.large);
  });

  // For extra large screens
  testWidgets(
      'MixBreakpointsTokens getScreenSize returns large for extra large screens',
      (tester) async {
    const tokens = MixBreakpointsTokens();
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(2000, 100)),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              return Container();
            },
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(Container));

    expect(tokens.getScreenSize(context), ScreenSizeToken.large);
  });
}
