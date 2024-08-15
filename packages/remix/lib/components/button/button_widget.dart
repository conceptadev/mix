part of 'button.dart';

typedef XButtonSpinnerBuilder = XComponentBuilder<SpinnerSpec>;

/// A customizable button component with various styling options.
///
/// The [XButton] allows you to create buttons with different variants, sizes,
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
class XButton extends StatelessWidget {
  const XButton({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.spinnerBuilder,
    required this.onPressed,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XButton.blank({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.spinnerBuilder,
    required this.onPressed,
    required this.style,
  }) : _blank = true;

  final String label;
  final bool disabled;
  final bool loading;
  final IconData? iconLeft;
  final IconData? iconRight;
  final VoidCallback? onPressed;
  final XButtonSpinnerBuilder? spinnerBuilder;
  final bool _blank;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final Style style;

  bool get _hasIcon => iconLeft != null || iconRight != null;

  Widget _buildLoadingOverlay(
    ButtonSpec spec,
    BuildContext context,
    Widget child,
  ) {
    final Widget spinner =
        spinnerBuilder?.call(context, spec.spinner) ?? spec.spinner();

    return loading
        ? Stack(
            alignment: Alignment.center,
            children: [spinner, Opacity(opacity: 0.0, child: child)],
          )
        : child;
  }

  Widget _buildChildren(ButtonSpec spec, BuildContext context) {
    final flexWidget = spec.flex(
      direction: Axis.horizontal,
      children: [
        if (iconLeft != null) spec.icon(iconLeft),
        // If there is no icon always render the label
        if (label.isNotEmpty || !_hasIcon) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ],
    );

    return loading
        ? _buildLoadingOverlay(spec, context, flexWidget)
        : flexWidget;
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || loading;

    return Pressable(
      enabled: !isDisabled,
      onPress: disabled || loading ? null : onPressed,
      child: SpecBuilder(
        builder: (context) {
          final spec = ButtonSpec.of(context);

          return spec.container(child: _buildChildren(spec, context));
        },
        style: _blank
            ? style
            : XButtonStyle.base.animate(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOut,
              ),
      ),
    );
  }
}
