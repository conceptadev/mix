part of 'scaffold.dart';

class Scaffold extends StatelessWidget {
  const Scaffold({
    super.key,
    required this.body,
    this.style,
    this.variants = const [],
  });

  final Widget body;
  final ScaffoldStyle? style;
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
