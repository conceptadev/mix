part of 'button.dart';

/// A customizable button component with various styling options.
///
/// The [RxButton] allows you to create buttons with different variants, sizes,
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
class RxButton extends StatelessWidget {
  const RxButton({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.variant = ButtonVariant.solid,
    this.size = ButtonSize.medium,
    required this.onPressed,
    this.style,
  });

  final String label;
  final bool disabled;
  final bool loading;
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonVariant variant;
  final ButtonSize size;
  final VoidCallback? onPressed;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final Style? style;

  @override
  Widget build(BuildContext context) {
    return RxBlankButton(
      iconLeft: iconLeft,
      iconRight: iconRight,
      disabled: disabled,
      loading: loading,
      label: label,
      onPressed: onPressed,
      style: _buildButtonStyle(style, [size, variant]),
    );
  }
}
