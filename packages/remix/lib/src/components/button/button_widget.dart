part of 'button.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.spinnerBuilder,
    this.variants = const [],
    required this.onPressed,
    this.style,
  });

  /// The text content displayed in the center of the button.
  final String label;

  /// {@template remix.component.disabled}
  /// When disabled, the component will not respond to user interaction and will
  /// appear visually distinct to indicate its disabled state.
  /// {@endtemplate}
  final bool disabled;

  /// {@template remix.component.loading}
  /// When loading, the component will display a spinner and disable user
  /// interaction. The component's content will be hidden but maintain its
  /// space to prevent layout shifts.
  /// {@endtemplate}
  final bool loading;

  /// The icon displayed in the left side of the button.
  final IconData? iconLeft;

  /// The icon displayed in the right side of the button.
  final IconData? iconRight;

  /// {@template remix.component.onPressed}
  /// Called when the component is tapped.
  /// If null or if [disabled] is true, the component will be disabled and won't
  /// respond to touch.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// A builder that returns a [Widget] for the button's spinner.
  ///
  /// This builder creates a widget to display when the button is loading.
  ///
  /// {@macro remix.widget_spec_builder.text_spec}
  ///
  /// ```dart
  /// Button(
  ///   label: 'Click me',
  ///   onPressed: () {},
  ///   spinnerBuilder: (spec) => spec(),
  /// );
  /// ```
  final WidgetSpecBuilder<SpinnerSpec>? spinnerBuilder;

  /// {@macro remix.component.variants}
  final List<Variant> variants;

  /// {@macro remix.component.style}
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || loading;

    final style = this.style ?? context.remix.components.button;
    final configuration = SpecConfiguration(context, ButtonSpecUtility.self);

    return Pressable(
      enabled: !isDisabled,
      onPress: disabled || loading ? null : onPressed,
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(variants),
        builder: (context) {
          return ButtonSpecWidget(
            spec: ButtonSpec.of(context),
            label: label,
            disabled: disabled,
            loading: loading,
            iconLeft: iconLeft,
            iconRight: iconRight,
            spinnerBuilder: spinnerBuilder,
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}

class ButtonSpecWidget extends StatelessWidget {
  const ButtonSpecWidget({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.spinnerBuilder,
    required this.onPressed,
    this.spec,
  });

  final String label;
  final bool disabled;
  final bool loading;
  final IconData? iconLeft;
  final IconData? iconRight;
  final VoidCallback? onPressed;
  final WidgetSpecBuilder<SpinnerSpec>? spinnerBuilder;
  final ButtonSpec? spec;

  bool get _hasIcon => iconLeft != null || iconRight != null;

  Widget _buildLoadingOverlay(ButtonSpec spec, Widget child) {
    final Widget spinner = spinnerBuilder?.call(spec.spinner) ?? spec.spinner();

    return loading
        ? Stack(
            alignment: Alignment.center,
            children: [spinner, Opacity(opacity: 0.0, child: child)],
          )
        : child;
  }

  Widget _buildChildren(ButtonSpec spec) {
    final flexboxWidget = spec.flexbox(
      direction: Axis.horizontal,
      children: [
        if (iconLeft != null) spec.icon(iconLeft),
        // If there is no icon always render the label
        if (label.isNotEmpty || !_hasIcon) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ],
    );

    return loading ? _buildLoadingOverlay(spec, flexboxWidget) : flexboxWidget;
  }

  @override
  Widget build(BuildContext context) {
    final spec = this.spec ?? const ButtonSpec();

    return _buildChildren(spec);
  }
}
