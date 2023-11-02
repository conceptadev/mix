import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/core/attribute.dart';
import 'package:mix/src/core/variants/variant.dart';
import 'package:mix/src/factory/mix_provider.dart';
import 'package:mix/src/factory/mix_provider_data.dart';
import 'package:mix/src/factory/style_mix.dart';
import 'package:mix/src/theme/mix_theme.dart';
import 'package:mockito/mockito.dart';

export 'package:mix/src/helpers/extensions/values_ext.dart';

class MockBuildContext extends Mock implements BuildContext {}

// ignore: non_constant_identifier_names
final EmptyMixData = Mix.createMixData(
  MockBuildContext(),
  StyleMix.empty,
);

Future<void> pumpWithMixData(
  WidgetTester tester, {
  StyleMix style = StyleMix.empty,
  required Widget Function(MixData mix) builder,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          // Populate MixData into the widget tree if needed
          return Mix.build(context, style, builder);
        },
      ),
    ),
  );
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

class MockDoubleScalarAttribute
    extends ScalarAttribute<MockDoubleScalarAttribute, double> {
  const MockDoubleScalarAttribute(super.value);

  @override
  MockDoubleScalarAttribute create(double value) =>
      MockDoubleScalarAttribute(value);
}

class MockIntScalarAttribute
    extends ScalarAttribute<MockIntScalarAttribute, int> {
  const MockIntScalarAttribute(super.value);

  @override
  MockIntScalarAttribute create(int value) => MockIntScalarAttribute(value);
}

class MockBooleanScalarAttribute
    extends ScalarAttribute<MockBooleanScalarAttribute, bool> {
  const MockBooleanScalarAttribute(super.value);

  @override
  MockBooleanScalarAttribute create(bool value) =>
      MockBooleanScalarAttribute(value);
}

const mockVariant = Variant('mock-variant');

@isTestGroup
void testScalarAttribute<T extends ScalarAttribute<T, V>, V>(
  String groupName,
  T Function(V value) builder,
  List<V> values,
) {
  group(groupName, () {
    for (var value1 in values) {
      for (var value2 in values.where((v) => v != value1)) {
        test('merge $value1 with $value2', () {
          final attr1 = builder(value1);
          final attr2 = builder(value2);
          final merged = attr1.merge(attr2);
          expect(merged.value, equals(value2));
        });

        test('resolve $value1', () {
          final attr = builder(value1);
          final resolvedValue = attr.resolve(EmptyMixData);
          expect(resolvedValue, equals(value1));
        });

        test('check equality between $value1 and $value2', () {
          final attr1 = builder(value1);
          final attr2 = builder(value2);
          expect(attr1, isNot(equals(attr2)));
        });

        test('check self-equality for $value1', () {
          final attr1 = builder(value1);
          final attr2 = builder(value1);
          expect(attr1, equals(attr2));
        });
      }

      test('merge null with $value1 returns itself', () {
        final attr1 = builder(value1);
        final merged = attr1.merge(null);
        expect(merged, equals(attr1));
      });
    }
  });
}
