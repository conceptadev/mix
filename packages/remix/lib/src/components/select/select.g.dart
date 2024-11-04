// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$SelectSpec on Spec<SelectSpec> {
  static SelectSpec from(MixData mix) {
    return mix.attributeOf<SelectSpecAttribute>()?.resolve(mix) ??
        const SelectSpec();
  }

  /// {@template select_spec_of}
  /// Retrieves the [SelectSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SelectSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SelectSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final selectSpec = SelectSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SelectSpec of(BuildContext context) {
    return _$SelectSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SelectSpec] but with the given fields
  /// replaced with the new values.
  @override
  SelectSpec copyWith({
    SelectButtonSpec? button,
    SelectMenuSpec? menu,
    MenuItemSpec? item,
    CompositedTransformFollowerSpec? position,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SelectSpec(
      button: button ?? _$this.button,
      menu: menu ?? _$this.menu,
      item: item ?? _$this.item,
      position: position ?? _$this.position,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SelectSpec] and another [SelectSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SelectSpec] is returned. When [t] is 1.0, the [other] [SelectSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SelectSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SelectSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SelectSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [button] and [menu] and [item] and [position] and [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SelectSpec] is used. Otherwise, the value
  /// from the [other] [SelectSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SelectSpec] configurations.
  @override
  SelectSpec lerp(SelectSpec? other, double t) {
    if (other == null) return _$this;

    return SelectSpec(
      button: _$this.button.lerp(other.button, t),
      menu: _$this.menu.lerp(other.menu, t),
      item: _$this.item.lerp(other.item, t),
      position: _$this.position.lerp(other.position, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.button,
        _$this.menu,
        _$this.item,
        _$this.position,
        _$this.modifiers,
        _$this.animated,
      ];

  SelectSpec get _$this => this as SelectSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty('button', _$this.button, defaultValue: null));
    properties
        .add(DiagnosticsProperty('menu', _$this.menu, defaultValue: null));
    properties
        .add(DiagnosticsProperty('item', _$this.item, defaultValue: null));
    properties.add(
        DiagnosticsProperty('position', _$this.position, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SelectSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SelectSpec].
///
/// Use this class to configure the attributes of a [SelectSpec] and pass it to
/// the [SelectSpec] constructor.
class SelectSpecAttribute extends SpecAttribute<SelectSpec>
    with Diagnosticable {
  final SelectButtonSpecAttribute? button;
  final SelectMenuSpecAttribute? menu;
  final MenuItemSpecAttribute? item;
  final CompositedTransformFollowerSpecAttribute? position;

  const SelectSpecAttribute({
    this.button,
    this.menu,
    this.item,
    this.position,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SelectSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final selectSpec = SelectSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SelectSpec resolve(MixData mix) {
    return SelectSpec(
      button: button?.resolve(mix),
      menu: menu?.resolve(mix),
      item: item?.resolve(mix),
      position: position?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SelectSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SelectSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SelectSpecAttribute merge(covariant SelectSpecAttribute? other) {
    if (other == null) return this;

    return SelectSpecAttribute(
      button: button?.merge(other.button) ?? other.button,
      menu: menu?.merge(other.menu) ?? other.menu,
      item: item?.merge(other.item) ?? other.item,
      position: position?.merge(other.position) ?? other.position,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        button,
        menu,
        item,
        position,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('button', button, defaultValue: null));
    properties.add(DiagnosticsProperty('menu', menu, defaultValue: null));
    properties.add(DiagnosticsProperty('item', item, defaultValue: null));
    properties
        .add(DiagnosticsProperty('position', position, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SelectSpec] properties.
///
/// This class provides methods to set individual properties of a [SelectSpec].
/// Use the methods of this class to configure specific properties of a [SelectSpec].
class SelectSpecUtility<T extends Attribute>
    extends SpecUtility<T, SelectSpecAttribute> {
  /// Utility for defining [SelectSpecAttribute.button]
  late final button = SelectButtonSpecUtility((v) => only(button: v));

  /// Utility for defining [SelectSpecAttribute.menu]
  late final menu = SelectMenuSpecUtility((v) => only(menu: v));

  /// Utility for defining [SelectSpecAttribute.item]
  late final item = MenuItemSpecUtility((v) => only(item: v));

  /// Utility for defining [SelectSpecAttribute.position]
  late final position =
      CompositedTransformFollowerSpecUtility((v) => only(position: v));

  /// Utility for defining [SelectSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SelectSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SelectSpecUtility(super.builder, {super.mutable});

  SelectSpecUtility<T> get chain =>
      SelectSpecUtility(attributeBuilder, mutable: true);

  static SelectSpecUtility<SelectSpecAttribute> get self =>
      SelectSpecUtility((v) => v);

  /// Returns a new [SelectSpecAttribute] with the specified properties.
  @override
  T only({
    SelectButtonSpecAttribute? button,
    SelectMenuSpecAttribute? menu,
    MenuItemSpecAttribute? item,
    CompositedTransformFollowerSpecAttribute? position,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SelectSpecAttribute(
      button: button,
      menu: menu,
      item: item,
      position: position,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SelectSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SelectSpec] specifications.
class SelectSpecTween extends Tween<SelectSpec?> {
  SelectSpecTween({
    super.begin,
    super.end,
  });

  @override
  SelectSpec lerp(double t) {
    if (begin == null && end == null) {
      return const SelectSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}

mixin _$SelectMenuSpec on Spec<SelectMenuSpec> {
  static SelectMenuSpec from(MixData mix) {
    return mix.attributeOf<SelectMenuSpecAttribute>()?.resolve(mix) ??
        const SelectMenuSpec();
  }

  /// {@template select_menu_spec_of}
  /// Retrieves the [SelectMenuSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SelectMenuSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SelectMenuSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final selectMenuSpec = SelectMenuSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SelectMenuSpec of(BuildContext context) {
    return _$SelectMenuSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SelectMenuSpec] but with the given fields
  /// replaced with the new values.
  @override
  SelectMenuSpec copyWith({
    BoxSpec? container,
    FlexSpec? flex,
    bool? autoWidth,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SelectMenuSpec(
      container: container ?? _$this.container,
      flex: flex ?? _$this.flex,
      autoWidth: autoWidth ?? _$this.autoWidth,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SelectMenuSpec] and another [SelectMenuSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SelectMenuSpec] is returned. When [t] is 1.0, the [other] [SelectMenuSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SelectMenuSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SelectMenuSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SelectMenuSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [flex].

  /// For [autoWidth] and [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SelectMenuSpec] is used. Otherwise, the value
  /// from the [other] [SelectMenuSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SelectMenuSpec] configurations.
  @override
  SelectMenuSpec lerp(SelectMenuSpec? other, double t) {
    if (other == null) return _$this;

    return SelectMenuSpec(
      container: _$this.container.lerp(other.container, t),
      flex: _$this.flex.lerp(other.flex, t),
      autoWidth: t < 0.5 ? _$this.autoWidth : other.autoWidth,
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectMenuSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectMenuSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.flex,
        _$this.autoWidth,
        _$this.modifiers,
        _$this.animated,
      ];

  SelectMenuSpec get _$this => this as SelectMenuSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('flex', _$this.flex, defaultValue: null));
    properties.add(
        DiagnosticsProperty('autoWidth', _$this.autoWidth, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SelectMenuSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SelectMenuSpec].
///
/// Use this class to configure the attributes of a [SelectMenuSpec] and pass it to
/// the [SelectMenuSpec] constructor.
base class SelectMenuSpecAttribute extends SpecAttribute<SelectMenuSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? flex;
  final bool? autoWidth;

  const SelectMenuSpecAttribute({
    this.container,
    this.flex,
    this.autoWidth,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SelectMenuSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final selectMenuSpec = SelectMenuSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SelectMenuSpec resolve(MixData mix) {
    return SelectMenuSpec(
      container: container?.resolve(mix),
      flex: flex?.resolve(mix),
      autoWidth: autoWidth,
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SelectMenuSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SelectMenuSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SelectMenuSpecAttribute merge(covariant SelectMenuSpecAttribute? other) {
    if (other == null) return this;

    return SelectMenuSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      flex: flex?.merge(other.flex) ?? other.flex,
      autoWidth: other.autoWidth ?? autoWidth,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectMenuSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectMenuSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        flex,
        autoWidth,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('flex', flex, defaultValue: null));
    properties
        .add(DiagnosticsProperty('autoWidth', autoWidth, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SelectMenuSpec] properties.
///
/// This class provides methods to set individual properties of a [SelectMenuSpec].
/// Use the methods of this class to configure specific properties of a [SelectMenuSpec].
class SelectMenuSpecUtility<T extends Attribute>
    extends SpecUtility<T, SelectMenuSpecAttribute> {
  /// Utility for defining [SelectMenuSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [SelectMenuSpecAttribute.flex]
  late final flex = FlexSpecUtility((v) => only(flex: v));

  /// Utility for defining [SelectMenuSpecAttribute.autoWidth]
  late final autoWidth = BoolUtility((v) => only(autoWidth: v));

  /// Utility for defining [SelectMenuSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SelectMenuSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SelectMenuSpecUtility(super.builder, {super.mutable});

  SelectMenuSpecUtility<T> get chain =>
      SelectMenuSpecUtility(attributeBuilder, mutable: true);

  static SelectMenuSpecUtility<SelectMenuSpecAttribute> get self =>
      SelectMenuSpecUtility((v) => v);

  /// Returns a new [SelectMenuSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    FlexSpecAttribute? flex,
    bool? autoWidth,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SelectMenuSpecAttribute(
      container: container,
      flex: flex,
      autoWidth: autoWidth,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SelectMenuSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SelectMenuSpec] specifications.
class SelectMenuSpecTween extends Tween<SelectMenuSpec?> {
  SelectMenuSpecTween({
    super.begin,
    super.end,
  });

  @override
  SelectMenuSpec lerp(double t) {
    if (begin == null && end == null) {
      return const SelectMenuSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}

mixin _$SelectButtonSpec on Spec<SelectButtonSpec> {
  static SelectButtonSpec from(MixData mix) {
    return mix.attributeOf<SelectButtonSpecAttribute>()?.resolve(mix) ??
        const SelectButtonSpec();
  }

  /// {@template select_button_spec_of}
  /// Retrieves the [SelectButtonSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SelectButtonSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SelectButtonSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final selectButtonSpec = SelectButtonSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SelectButtonSpec of(BuildContext context) {
    return _$SelectButtonSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SelectButtonSpec] but with the given fields
  /// replaced with the new values.
  @override
  SelectButtonSpec copyWith({
    BoxSpec? container,
    FlexSpec? layout,
    IconSpec? icon,
    TextSpec? label,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SelectButtonSpec(
      container: container ?? _$this.container,
      layout: layout ?? _$this.layout,
      icon: icon ?? _$this.icon,
      label: label ?? _$this.label,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SelectButtonSpec] and another [SelectButtonSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SelectButtonSpec] is returned. When [t] is 1.0, the [other] [SelectButtonSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SelectButtonSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SelectButtonSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SelectButtonSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [layout].
  /// - [IconSpec.lerp] for [icon].
  /// - [TextSpec.lerp] for [label].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SelectButtonSpec] is used. Otherwise, the value
  /// from the [other] [SelectButtonSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SelectButtonSpec] configurations.
  @override
  SelectButtonSpec lerp(SelectButtonSpec? other, double t) {
    if (other == null) return _$this;

    return SelectButtonSpec(
      container: _$this.container.lerp(other.container, t),
      layout: _$this.layout.lerp(other.layout, t),
      icon: _$this.icon.lerp(other.icon, t),
      label: _$this.label.lerp(other.label, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectButtonSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectButtonSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.layout,
        _$this.icon,
        _$this.label,
        _$this.modifiers,
        _$this.animated,
      ];

  SelectButtonSpec get _$this => this as SelectButtonSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('layout', _$this.layout, defaultValue: null));
    properties
        .add(DiagnosticsProperty('icon', _$this.icon, defaultValue: null));
    properties
        .add(DiagnosticsProperty('label', _$this.label, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SelectButtonSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SelectButtonSpec].
///
/// Use this class to configure the attributes of a [SelectButtonSpec] and pass it to
/// the [SelectButtonSpec] constructor.
class SelectButtonSpecAttribute extends SpecAttribute<SelectButtonSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? layout;
  final IconSpecAttribute? icon;
  final TextSpecAttribute? label;

  const SelectButtonSpecAttribute({
    this.container,
    this.layout,
    this.icon,
    this.label,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SelectButtonSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final selectButtonSpec = SelectButtonSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SelectButtonSpec resolve(MixData mix) {
    return SelectButtonSpec(
      container: container?.resolve(mix),
      layout: layout?.resolve(mix),
      icon: icon?.resolve(mix),
      label: label?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SelectButtonSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SelectButtonSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SelectButtonSpecAttribute merge(covariant SelectButtonSpecAttribute? other) {
    if (other == null) return this;

    return SelectButtonSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      layout: layout?.merge(other.layout) ?? other.layout,
      icon: icon?.merge(other.icon) ?? other.icon,
      label: label?.merge(other.label) ?? other.label,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectButtonSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectButtonSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        layout,
        icon,
        label,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('layout', layout, defaultValue: null));
    properties.add(DiagnosticsProperty('icon', icon, defaultValue: null));
    properties.add(DiagnosticsProperty('label', label, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SelectButtonSpec] properties.
///
/// This class provides methods to set individual properties of a [SelectButtonSpec].
/// Use the methods of this class to configure specific properties of a [SelectButtonSpec].
class SelectButtonSpecUtility<T extends Attribute>
    extends SpecUtility<T, SelectButtonSpecAttribute> {
  /// Utility for defining [SelectButtonSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [SelectButtonSpecAttribute.layout]
  late final layout = FlexSpecUtility((v) => only(layout: v));

  /// Utility for defining [SelectButtonSpecAttribute.icon]
  late final icon = IconSpecUtility((v) => only(icon: v));

  /// Utility for defining [SelectButtonSpecAttribute.label]
  late final label = TextSpecUtility((v) => only(label: v));

  /// Utility for defining [SelectButtonSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SelectButtonSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SelectButtonSpecUtility(super.builder, {super.mutable});

  SelectButtonSpecUtility<T> get chain =>
      SelectButtonSpecUtility(attributeBuilder, mutable: true);

  static SelectButtonSpecUtility<SelectButtonSpecAttribute> get self =>
      SelectButtonSpecUtility((v) => v);

  /// Returns a new [SelectButtonSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    FlexSpecAttribute? layout,
    IconSpecAttribute? icon,
    TextSpecAttribute? label,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SelectButtonSpecAttribute(
      container: container,
      layout: layout,
      icon: icon,
      label: label,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SelectButtonSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SelectButtonSpec] specifications.
class SelectButtonSpecTween extends Tween<SelectButtonSpec?> {
  SelectButtonSpecTween({
    super.begin,
    super.end,
  });

  @override
  SelectButtonSpec lerp(double t) {
    if (begin == null && end == null) {
      return const SelectButtonSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}

mixin _$SelectMenuItemSpec on Spec<SelectMenuItemSpec> {
  static SelectMenuItemSpec from(MixData mix) {
    return mix.attributeOf<SelectMenuItemSpecAttribute>()?.resolve(mix) ??
        const SelectMenuItemSpec();
  }

  /// {@template select_menu_item_spec_of}
  /// Retrieves the [SelectMenuItemSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SelectMenuItemSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SelectMenuItemSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final selectMenuItemSpec = SelectMenuItemSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SelectMenuItemSpec of(BuildContext context) {
    return _$SelectMenuItemSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SelectMenuItemSpec] but with the given fields
  /// replaced with the new values.
  @override
  SelectMenuItemSpec copyWith({
    IconSpec? icon,
    TextSpec? text,
    BoxSpec? container,
    FlexSpec? layout,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SelectMenuItemSpec(
      icon: icon ?? _$this.icon,
      text: text ?? _$this.text,
      container: container ?? _$this.container,
      layout: layout ?? _$this.layout,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SelectMenuItemSpec] and another [SelectMenuItemSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SelectMenuItemSpec] is returned. When [t] is 1.0, the [other] [SelectMenuItemSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SelectMenuItemSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SelectMenuItemSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SelectMenuItemSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [IconSpec.lerp] for [icon].
  /// - [TextSpec.lerp] for [text].
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [layout].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SelectMenuItemSpec] is used. Otherwise, the value
  /// from the [other] [SelectMenuItemSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SelectMenuItemSpec] configurations.
  @override
  SelectMenuItemSpec lerp(SelectMenuItemSpec? other, double t) {
    if (other == null) return _$this;

    return SelectMenuItemSpec(
      icon: _$this.icon.lerp(other.icon, t),
      text: _$this.text.lerp(other.text, t),
      container: _$this.container.lerp(other.container, t),
      layout: _$this.layout.lerp(other.layout, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectMenuItemSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectMenuItemSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.icon,
        _$this.text,
        _$this.container,
        _$this.layout,
        _$this.modifiers,
        _$this.animated,
      ];

  SelectMenuItemSpec get _$this => this as SelectMenuItemSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty('icon', _$this.icon, defaultValue: null));
    properties
        .add(DiagnosticsProperty('text', _$this.text, defaultValue: null));
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('layout', _$this.layout, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SelectMenuItemSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SelectMenuItemSpec].
///
/// Use this class to configure the attributes of a [SelectMenuItemSpec] and pass it to
/// the [SelectMenuItemSpec] constructor.
base class SelectMenuItemSpecAttribute extends SpecAttribute<SelectMenuItemSpec>
    with Diagnosticable {
  final IconSpecAttribute? icon;
  final TextSpecAttribute? text;
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? layout;

  const SelectMenuItemSpecAttribute({
    this.icon,
    this.text,
    this.container,
    this.layout,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SelectMenuItemSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final selectMenuItemSpec = SelectMenuItemSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SelectMenuItemSpec resolve(MixData mix) {
    return SelectMenuItemSpec(
      icon: icon?.resolve(mix),
      text: text?.resolve(mix),
      container: container?.resolve(mix),
      layout: layout?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SelectMenuItemSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SelectMenuItemSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SelectMenuItemSpecAttribute merge(
      covariant SelectMenuItemSpecAttribute? other) {
    if (other == null) return this;

    return SelectMenuItemSpecAttribute(
      icon: icon?.merge(other.icon) ?? other.icon,
      text: text?.merge(other.text) ?? other.text,
      container: container?.merge(other.container) ?? other.container,
      layout: layout?.merge(other.layout) ?? other.layout,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SelectMenuItemSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SelectMenuItemSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        icon,
        text,
        container,
        layout,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('icon', icon, defaultValue: null));
    properties.add(DiagnosticsProperty('text', text, defaultValue: null));
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('layout', layout, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SelectMenuItemSpec] properties.
///
/// This class provides methods to set individual properties of a [SelectMenuItemSpec].
/// Use the methods of this class to configure specific properties of a [SelectMenuItemSpec].
class SelectMenuItemSpecUtility<T extends Attribute>
    extends SpecUtility<T, SelectMenuItemSpecAttribute> {
  /// Utility for defining [SelectMenuItemSpecAttribute.icon]
  late final icon = IconSpecUtility((v) => only(icon: v));

  /// Utility for defining [SelectMenuItemSpecAttribute.text]
  late final text = TextSpecUtility((v) => only(text: v));

  /// Utility for defining [SelectMenuItemSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [SelectMenuItemSpecAttribute.layout]
  late final layout = FlexSpecUtility((v) => only(layout: v));

  /// Utility for defining [SelectMenuItemSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SelectMenuItemSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SelectMenuItemSpecUtility(super.builder, {super.mutable});

  SelectMenuItemSpecUtility<T> get chain =>
      SelectMenuItemSpecUtility(attributeBuilder, mutable: true);

  static SelectMenuItemSpecUtility<SelectMenuItemSpecAttribute> get self =>
      SelectMenuItemSpecUtility((v) => v);

  /// Returns a new [SelectMenuItemSpecAttribute] with the specified properties.
  @override
  T only({
    IconSpecAttribute? icon,
    TextSpecAttribute? text,
    BoxSpecAttribute? container,
    FlexSpecAttribute? layout,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SelectMenuItemSpecAttribute(
      icon: icon,
      text: text,
      container: container,
      layout: layout,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SelectMenuItemSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SelectMenuItemSpec] specifications.
class SelectMenuItemSpecTween extends Tween<SelectMenuItemSpec?> {
  SelectMenuItemSpecTween({
    super.begin,
    super.end,
  });

  @override
  SelectMenuItemSpec lerp(double t) {
    if (begin == null && end == null) {
      return const SelectMenuItemSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
