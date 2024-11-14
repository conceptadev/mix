part of 'icon_button.dart';

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
class IconButton extends StatelessWidget {
  const IconButton(
    this.icon, {
    super.key,
    this.disabled = false,
    this.loading = false,
    this.spinnerBuilder,
    this.variants = const [],
    required this.onPressed,
    this.style,
  });

  final bool disabled;
  final bool loading;
  final IconData? icon;
  final VoidCallback? onPressed;
  final WidgetSpecBuilder<SpinnerSpec>? spinnerBuilder;
  final List<Variant> variants;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final IconButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || loading;

    final style = this.style ?? context.remix.components.iconButton;
    final configuration =
        SpecConfiguration(context, IconButtonSpecUtility.self);

    return Pressable(
      enabled: !isDisabled,
      onPress: disabled || loading ? null : onPressed,
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(variants),
        builder: (context) {
          final spec = IconButtonSpec.of(context);

          return spec.container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (loading) spec.spinner(),
                if (!loading) spec.icon(icon),
              ],
            ),
          );
        },
      ),
    );
  }
}
