part of 'scaffold.dart';

/// A widget that provides a basic structure for a page or screen.
///
/// It consists of a single [body] widget that is wrapped in a
/// container with styling applied.
///
/// The [style] parameter allows you to customize the appearance of the scaffold
/// using a [ScaffoldStyle]. If no style is provided, the default style from the
/// theme will be used.
///
/// The [variants] parameter allows you to apply style variants to modify the
/// appearance of the scaffold.
///
/// When a Scaffold is added to the widget tree, it automatically applies a
/// [ToastLayer] that enables the display of [Toast] components within its scope.
///
/// Example:
/// ```dart
/// Scaffold(
///   body: Center(
///     child: Text('Hello World'),
///   ),
/// )
/// ```
class Scaffold extends StatelessWidget {
  const Scaffold({
    super.key,
    required this.body,
    this.style,
    this.variants = const [],
  });

  /// The primary content of the scaffold.
  final Widget body;

  /// {@macro remix.component.style}
  final ScaffoldStyle? style;

  /// {@macro remix.component.variants}
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.scaffold;
    final configuration = SpecConfiguration(context, ScaffoldSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
      builder: (context) {
        final spec = ScaffoldSpec.of(context);

        return spec.container(child: ToastLayer(child: body));
      },
    );
  }
}
