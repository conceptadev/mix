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

  /// Whether the button is disabled or enabled.
  final bool disabled;

  /// Whether the button is loading or not.
  final bool loading;

  /// The icon displayed in the left side of the button.
  final IconData? iconLeft;

  /// The icon displayed in the right side of the button.
  final IconData? iconRight;

  /// Called when the button is tapped or otherwise activated
  final VoidCallback? onPressed;

  /// A builder for the spinner widget.
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
    final flexWidget = spec.layout(
      direction: Axis.horizontal,
      children: [
        if (iconLeft != null) spec.icon(iconLeft),
        // If there is no icon always render the label
        if (label.isNotEmpty || !_hasIcon) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ],
    );

    return loading ? _buildLoadingOverlay(spec, flexWidget) : flexWidget;
  }

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
          final spec = ButtonSpec.of(context);

          return spec.container(child: _buildChildren(spec));
        },
      ),
    );
  }
}
