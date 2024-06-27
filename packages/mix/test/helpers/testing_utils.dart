// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/internal/lerp_helpers.dart';

export 'package:mix/src/internal/values_ext.dart';

class MockBuildContext extends BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>(
      {Object? aspect}) {
    return null;
  }

  @override
  InheritedElement?
      getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
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

Widget createBrightnessTheme(Brightness brightness, {Widget? child}) {
  return MixTheme(
    data: MixThemeData(),
    child: MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              child: child,
            );
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
          return Mix.build(
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
    MixThemeData? theme,
  }) async {
    await pumpWidget(
      MaterialApp(home: MixTheme(data: theme ?? MixThemeData(), child: widget)),
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
        home: WidgetStateModel(
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

final class MockDoubleScalarAttribute
    extends TestScalarAttribute<MockDoubleScalarAttribute, double> {
  const MockDoubleScalarAttribute(super.value);
}

class MockContextVariantCondition extends ContextVariant {
  final bool condition;
  @override
  final VariantPriority priority;
  const MockContextVariantCondition(this.condition,
      {this.priority = VariantPriority.normal});

  @override
  List<Object?> get props => [condition];

  @override
  Object get mergeKey => '$runtimeType.${priority.name}';

  @override
  bool when(BuildContext context) => condition;
}

final class MockIntScalarAttribute
    extends TestScalarAttribute<MockIntScalarAttribute, int> {
  const MockIntScalarAttribute(super.value);
}

class MockContextVariant extends ContextVariant {
  @override
  final VariantPriority priority;
  const MockContextVariant([this.priority = VariantPriority.normal]);

  @override
  bool when(BuildContext context) => true;
}

final class MockBooleanScalarAttribute
    extends TestScalarAttribute<MockBooleanScalarAttribute, bool> {
  const MockBooleanScalarAttribute(super.value);
}

abstract base class _MockSpecAttribute<T> extends SpecAttribute<T> {
  final T _value;
  const _MockSpecAttribute(this._value);

  @override
  T resolve(MixData mix) => _value;

  @override
  _MockSpecAttribute<T> merge(_MockSpecAttribute<T>? other);

  @override
  get props => [_value];
}

final class MockSpecBooleanAttribute extends _MockSpecAttribute<bool> {
  const MockSpecBooleanAttribute(super.value);

  @override
  MockSpecBooleanAttribute merge(MockSpecBooleanAttribute? other) {
    return MockSpecBooleanAttribute(other?._value ?? _value);
  }
}

final class MockSpecIntAttribute extends _MockSpecAttribute<int> {
  const MockSpecIntAttribute(super.value);

  @override
  MockSpecIntAttribute merge(MockSpecIntAttribute? other) {
    return MockSpecIntAttribute(other?._value ?? _value);
  }
}

final class MockSpecDoubleAttribute extends _MockSpecAttribute<double> {
  const MockSpecDoubleAttribute(super.value);

  @override
  MockSpecDoubleAttribute merge(MockSpecDoubleAttribute? other) {
    return MockSpecDoubleAttribute(other?._value ?? _value);
  }
}

final class MockSpecStringAttribute extends _MockSpecAttribute<String> {
  const MockSpecStringAttribute(super.value);

  @override
  MockSpecStringAttribute merge(MockSpecStringAttribute? other) {
    return MockSpecStringAttribute(other?._value ?? _value);
  }
}

final class MockStringScalarAttribute
    extends TestScalarAttribute<MockStringScalarAttribute, String> {
  const MockStringScalarAttribute(super.value);
}

final class MockInvalidAttribute extends Attribute {
  const MockInvalidAttribute();

  @override
  MockInvalidAttribute merge(MockInvalidAttribute? other) {
    return const MockInvalidAttribute();
  }

  @override
  get props => [];
}

const mockVariant = Variant('mock-variant');

final class UtilityTestAttribute<T>
    extends TestScalarAttribute<UtilityTestAttribute<T>, T> {
  const UtilityTestAttribute(super.value);
}

final class UtilityTestDtoAttribute<T extends Dto<V>, V>
    extends TestScalarAttribute<UtilityTestDtoAttribute<T, V>, T> {
  const UtilityTestDtoAttribute(super.value);

  V resolve(MixData mix) {
    return value.resolve(mix);
  }
}

final class CustomWidgetModifierSpec
    extends WidgetModifierSpec<CustomWidgetModifierSpec> {
  final bool value;
  const CustomWidgetModifierSpec(
    this.value, {
    super.animated,
  });

  @override
  CustomWidgetModifierSpec copyWith({bool? value}) {
    return CustomWidgetModifierSpec(value ?? this.value);
  }

  @override
  CustomWidgetModifierSpec lerp(CustomWidgetModifierSpec? other, double t) {
    if (other == null) return this;

    return CustomWidgetModifierSpec(lerpSnap(value, other.value, t) ?? value);
  }

  @override
  get props => [value];

  @override
  Widget build(Widget child) {
    return Padding(padding: const EdgeInsets.all(8.0), child: child);
  }
}

final class CustomModifierAttribute extends WidgetModifierAttribute<
    CustomModifierAttribute, CustomWidgetModifierSpec> {
  final bool? value;
  const CustomModifierAttribute([this.value = true]);

  @override
  CustomWidgetModifierSpec resolve(MixData mix) {
    return CustomWidgetModifierSpec(value ?? true);
  }

  @override
  CustomModifierAttribute merge(CustomModifierAttribute? other) {
    return CustomModifierAttribute(other?.value ?? true);
  }

  @override
  get props => [value];
}

class WidgetWithTestableBuild extends StyledWidget {
  const WidgetWithTestableBuild(
    this.onBuild, {
    super.key,
    super.orderOfModifiers = const [],
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

abstract base class TestScalarAttribute<
    Self extends TestScalarAttribute<Self, Value>,
    Value> extends StyledAttribute {
  final Value value;
  const TestScalarAttribute(this.value);

  @override
  get props => [value];

  @override
  Self merge(Self? other) {
    return other ?? this as Self;
  }
}
