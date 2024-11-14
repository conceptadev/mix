part of 'button.dart';

/// A customizable button component with various styling options.
///
/// The [Button] allows you to create buttons with different variants, sizes,
/// and icons. You can also disable the button or show a loading state.
///
/// Example usage:
///
/// ```dart
/// RxButton(
///   label: 'Click me',
///   onPressed: () {},
///   iconLeft: Icons.add,
/// )
/// ```
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.spinnerBuilder,
    this.variant,
    this.variants = const [],
    required this.onPressed,
    this.style,
  });

  final String label;
  final bool disabled;
  final bool loading;
  final IconData? iconLeft;
  final IconData? iconRight;
  final VoidCallback? onPressed;
  final WidgetSpecBuilder<SpinnerSpec>? spinnerBuilder;

  final Variant? variant;
  final List<Variant> variants;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
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
        style: style.makeStyle(configuration).applyVariants([
          ...variants,
          if (variant != null) variant!,
        ]),
        builder: (context) {
          return ButtonSpecWidget(
            label: label,
            disabled: disabled,
            loading: loading,
            iconLeft: iconLeft,
            iconRight: iconRight,
            spinnerBuilder: spinnerBuilder,
            onPressed: onPressed,
            spec: ButtonSpec.of(context),
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
      children: [
        if (iconLeft != null) spec.icon(iconLeft),
        // If there is no icon always render the label
        if (label.isNotEmpty || !_hasIcon) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ],
      direction: Axis.horizontal,
    );

    return loading ? _buildLoadingOverlay(spec, flexboxWidget) : flexboxWidget;
  }

  @override
  Widget build(BuildContext context) {
    final spec = this.spec ?? const ButtonSpec();

    return _buildChildren(spec);
  }
}
