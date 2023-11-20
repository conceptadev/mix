// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:mix/mix.dart';
import 'package:mockito/mockito.dart';

export 'package:mix/src/helpers/extensions/values_ext.dart';

class MockBuildContext extends Mock implements BuildContext {}

MixData MockMixData(
  StyleMix style,
) {
  return MixData.create(
    MockBuildContext(),
    style,
  );
}

final EmptyMixData = MixData.create(
  MockBuildContext(),
  StyleMix.empty,
);

MediaQuery createMediaQuery(Size size) {
  return MediaQuery(
    data: MediaQueryData(size: size),
    child: MixTheme(
      data: MixThemeData(),
      child: MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return Container();
            },
          ),
        ),
      ),
    ),
  );
}

Widget createBrightnessTheme(Brightness brightness) {
  return MixTheme(
    data: MixThemeData(),
    child: MaterialApp(
      theme: ThemeData(brightness: brightness),
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Container();
          },
        ),
      ),
    ),
  );
}

Widget createDirectionality(TextDirection direction) {
  return MixTheme(
    data: MixThemeData(),
    child: MaterialApp(
      home: Directionality(
        textDirection: direction,
        child: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return Container();
            },
          ),
        ),
      ),
    ),
  );
}

Widget createWithMixTheme(
  MixThemeData theme,
) {
  return MixTheme(
    data: theme,
    child: MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Container();
          },
        ),
      ),
    ),
  );
}

extension WidgetTesterExt on WidgetTester {
  Future<void> pumpWithMix(
    Widget widget, {
    StyleMix style = StyleMix.empty,
    MixThemeData theme = const MixThemeData.empty(),
  }) async {
    await pumpWidget(
      MaterialApp(
        home: MixTheme(
          data: theme,
          child: Builder(
            builder: (BuildContext context) {
              // Populate MixData into the widget tree if needed
              return MixProvider.build(context,
                  style: style, builder: (_) => widget);
            },
          ),
        ),
      ),
    );
  }

  Future<void> pumpWithPressable(
    Widget widget, {
    PressableState state = PressableState.pressed,
    bool focus = false,
  }) async {
    await pumpWidget(
      MaterialApp(
        home: PressableNotifier(
          state: state,
          focus: focus,
          child: widget,
        ),
      ),
    );
  }

  Future<void> pumpMaterialApp(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        home: widget,
      ),
    );
  }

  Future<void> pumpStyledWidget(
    StyledWidget widget, {
    MixThemeData theme = const MixThemeData.empty(),
  }) async {
    await pumpWidget(
      MaterialApp(
        home: MixTheme(
          data: theme,
          child: widget,
        ),
      ),
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

class MockDoubleScalarAttribute
    extends ValueAttribute<MockDoubleScalarAttribute, double> {
  const MockDoubleScalarAttribute(super.value);

  @override
  final create = MockDoubleScalarAttribute.new;
}

class MockIntScalarAttribute
    extends ValueAttribute<MockIntScalarAttribute, int> {
  const MockIntScalarAttribute(super.value);

  @override
  final create = MockIntScalarAttribute.new;
}

class MockDoubleDecoratorAttribute extends Decorator<double> {
  final double value;
  const MockDoubleDecoratorAttribute(this.value);

  @override
  MockDoubleDecoratorAttribute merge(MockDoubleDecoratorAttribute? other) {
    return MockDoubleDecoratorAttribute(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, value) {
    return SizedBox(
      height: value,
      width: value,
      child: child,
    );
  }
}

class MockBooleanScalarAttribute
    extends ValueAttribute<MockBooleanScalarAttribute, bool> {
  const MockBooleanScalarAttribute(super.value);

  @override
  final create = MockBooleanScalarAttribute.new;
}

class MockStringScalarAttribute
    extends ValueAttribute<MockStringScalarAttribute, String> {
  const MockStringScalarAttribute(super.value);

  @override
  final create = MockStringScalarAttribute.new;
}

class MockInvalidAttribute extends Attribute {
  const MockInvalidAttribute();

  @override
  get props => [];

  @override
  MockInvalidAttribute merge(MockInvalidAttribute? other) {
    return this;
  }
}

const mockVariant = Variant('mock-variant');

@isTestGroup
void testScalarAttribute<T extends ValueAttribute<T, V>, V>(
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

      test('resolves correctly', () {
        final attr = builder(value1);
        final resolvedValue = attr.resolve(EmptyMixData);
        expect(resolvedValue, equals(value1));
      });
    }
  });
}
