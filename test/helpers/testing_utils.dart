// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:mix/mix.dart';
import 'package:mockito/mockito.dart';

export 'package:mix/src/core/extensions/values_ext.dart';

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
    await pumpWithMixTheme(
      Builder(
        builder: (BuildContext context) {
          // Populate MixData into the widget tree if needed
          return MixProvider.build(
            context,
            style: style,
            builder: (_) => widget,
          );
        },
      ),
    );
  }

  Future<void> pumpWithMixTheme(
    Widget widget, {
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
    extends ScalarAttribute<MockDoubleScalarAttribute, double> {
  const MockDoubleScalarAttribute(super.value);
}

class MockIntScalarAttribute
    extends ScalarAttribute<MockIntScalarAttribute, int> {
  const MockIntScalarAttribute(super.value);
}

class MockDoubleDecoratorAttribute extends Decorator {
  final double value;
  const MockDoubleDecoratorAttribute(this.value, {super.key});

  @override
  get props => [value];

  @override
  Type get type => MockDoubleDecoratorAttribute;
}

class MockBooleanScalarAttribute
    extends ScalarAttribute<MockBooleanScalarAttribute, bool> {
  const MockBooleanScalarAttribute(super.value);
}

class MockStringScalarAttribute
    extends ScalarAttribute<MockStringScalarAttribute, String> {
  const MockStringScalarAttribute(super.value);
}

class MockInvalidAttribute extends Attribute {
  const MockInvalidAttribute();

  @override
  get props => [];
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
        test('resolve $value1', () {
          final attr = builder(value1);

          expect(attr.value, equals(value1));
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
    }
  });
}

class ValueHolderAttribute<T>
    extends ScalarAttribute<ValueHolderAttribute<T>, T> {
  const ValueHolderAttribute(super.value);
}
