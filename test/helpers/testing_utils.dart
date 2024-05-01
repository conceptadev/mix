// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/lerp_helpers.dart';

export 'package:mix/src/core/extensions/values_ext.dart';

class MockBuildContext extends BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>(
      {Object? aspect}) {
    return null;
  }
}

MixData MockMixData(Style style) {
  return MixData.create(MockBuildContext(), style);
}

final EmptyMixData = MixData.create(MockBuildContext(), const Style.empty());

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
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Container();
          },
        ),
      ),
      theme: ThemeData(brightness: brightness),
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

Widget createWithMixTheme(MixThemeData theme) {
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
    Style style = const Style.empty(),
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
      MaterialApp(home: MixTheme(data: theme, child: widget)),
    );
  }

  Future<void> pumpWithPressable(
    Widget widget, {
    bool disabled = false,
    bool focus = false,
    bool pressed = false,
    bool hovered = false,
    bool longPressed = false,
  }) async {
    await pumpWidget(
      MaterialApp(
        home: PressableState(
          enabled: !disabled,
          focused: focus,
          pressed: pressed,
          hovered: hovered,
          longPressed: longPressed,
          pointerPosition: null,
          child: widget,
        ),
      ),
    );
  }

  Future<void> pumpMaterialApp(Widget widget) async {
    await pumpWidget(MaterialApp(home: widget));
  }

  Future<void> pumpStyledWidget(
    StyledWidget widget, {
    MixThemeData theme = const MixThemeData.empty(),
  }) async {
    await pumpWidget(
      MaterialApp(home: MixTheme(data: theme, child: widget)),
    );
  }
}

// ignore: constant_identifier_names
const FillWidget = SizedBox(width: 25, height: 25);

class WrapMixThemeWidget extends StatelessWidget {
  const WrapMixThemeWidget({required this.child, this.theme, Key? key})
      : super(key: key);

  final Widget child;
  final MixThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: theme ?? MixThemeData(),
      child: Directionality(textDirection: TextDirection.ltr, child: child),
    );
  }
}

class MockDoubleScalarAttribute
    extends ScalarAttribute<MockDoubleScalarAttribute, double> {
  const MockDoubleScalarAttribute(super.value);
}

class MockContextVariantCondition extends ContextVariant {
  final bool condition;
  MockContextVariantCondition(this.condition, {super.priority})
      : super(key: ValueKey(condition));

  @override
  List<Object?> get props => [key, condition];

  @override
  bool build(BuildContext context) => condition;
}

class MockIntScalarAttribute
    extends ScalarAttribute<MockIntScalarAttribute, int> {
  const MockIntScalarAttribute(super.value);
}

class MockContextVariant extends ContextVariant {
  const MockContextVariant({super.key});

  @override
  bool build(BuildContext context) => true;
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
  Type get type => MockInvalidAttribute;

  @override
  get props => [];
}

const mockVariant = Variant('mock-variant');

class UtilityTestAttribute<T>
    extends ScalarAttribute<UtilityTestAttribute<T>, T> {
  const UtilityTestAttribute(super.value);
}

class UtilityTestDtoAttribute<T extends Dto<V>, V>
    extends ScalarAttribute<UtilityTestDtoAttribute<T, V>, T> {
  const UtilityTestDtoAttribute(super.value);

  V resolve(MixData mix) {
    return value.resolve(mix);
  }
}

class CustomWidgetDecoratorSpec
    extends DecoratorSpec<CustomWidgetDecoratorSpec> {
  final bool value;
  const CustomWidgetDecoratorSpec(this.value);

  @override
  CustomWidgetDecoratorSpec copyWith({bool? value}) {
    return CustomWidgetDecoratorSpec(value ?? this.value);
  }

  @override
  CustomWidgetDecoratorSpec lerp(CustomWidgetDecoratorSpec? other, double t) {
    if (other == null) return this;

    return CustomWidgetDecoratorSpec(lerpSnap(value, other.value, t) ?? value);
  }

  @override
  get props => [value];

  @override
  Widget build(Widget child) {
    return Padding(padding: const EdgeInsets.all(8.0), child: child);
  }
}

class CustomDecoratorAttribute extends DecoratorAttribute<
    CustomDecoratorAttribute, CustomWidgetDecoratorSpec> {
  final bool? value;
  const CustomDecoratorAttribute([this.value = true]);

  @override
  CustomWidgetDecoratorSpec resolve(MixData mix) {
    return CustomWidgetDecoratorSpec(value ?? true);
  }

  @override
  CustomDecoratorAttribute merge(CustomDecoratorAttribute? other) {
    return CustomDecoratorAttribute(other?.value ?? true);
  }

  @override
  get props => [value];
}

class WidgetWithTestableBuild extends StyledWidget {
  const WidgetWithTestableBuild(
    this.onBuild, {
    super.key,
    super.orderOfDecorators = const [],
  });

  final void Function(BuildContext context) onBuild;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (_) {
      onBuild(context);

      return const SizedBox();
    });
  }
}
