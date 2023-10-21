import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/mix_theme.dart';
import 'package:mockito/mockito.dart';

export 'package:mix/src/helpers/extensions/helper_ext.dart';

class MockBuildContext extends Mock implements BuildContext {}

// ignore: non_constant_identifier_names
final EmptyMixData = MixData.create(
  context: MockBuildContext(),
  style: StyleMix.empty,
);

Future<void> pumpWithMixData(
  WidgetTester tester, {
  StyleMix style = StyleMix.empty,
  required Function(MixData mix) builder,
}) async {
  final mixDataCompleter = Completer<MixData>();

  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          // Populate MixData into the widget tree if needed
          final mixData = MixData.create(
            context: context,
            style: style,
          ); // Replace with your actual MixData setup
          // For example, using InheritedWidget or Provider
          mixDataCompleter.complete(mixData);
          return Container();
        },
      ),
    ),
  );

  // Call the test callback, passing in the MixData object
  final mixData = await mixDataCompleter.future;
  builder(mixData);
}

class TestMixWidget extends StatelessWidget {
  const TestMixWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}

// ignore: constant_identifier_names
const FillWidget = SizedBox(
  height: 25,
  width: 25,
);

class WrapMixThemeWidget extends StatelessWidget {
  const WrapMixThemeWidget({
    required this.child,
    this.theme,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final MixThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: theme ?? MixThemeData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    );
  }
}

class BoxInsideFlexWidget extends StatelessWidget {
  const BoxInsideFlexWidget(this.mix, {Key? key}) : super(key: key);

  final StyleMix mix;

  @override
  Widget build(BuildContext context) {
    return TestMixWidget(
      child: Column(
        children: [
          StyledContainer(
            style: mix,
            child: FillWidget,
          ),
        ],
      ),
    );
  }
}

class BoxTestWidget extends StatelessWidget {
  const BoxTestWidget(
    this.mix, {
    Key? key,
    double? height,
    double? width,
  }) : super(key: key);

  final StyleMix mix;

  @override
  Widget build(BuildContext context) {
    return TestMixWidget(
      child: StyledContainer(
        style: mix,
        child: const SizedBox(
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
