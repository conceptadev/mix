part of 'toast.dart';

class Toast extends StatelessWidget {
  const Toast({
    super.key,
    required this.title,
    this.description,
    this.trailing,
    this.leading,
    this.style,
    this.variants = const [],
  });

  final String title;
  final String? description;
  final Widget? trailing;
  final Widget? leading;

  final ToastStyle? style;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.toast;
    final configuration = SpecConfiguration(context, ToastSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
      builder: (context) {
        final spec = ToastSpec.of(context);

        return spec.container(
          child: spec.containerFlex(
            direction: Axis.horizontal,
            children: [
              if (leading != null) leading!,
              spec.textContentFlex(
                direction: Axis.vertical,
                children: [
                  spec.title(title),
                  if (description != null) spec.description(description!),
                ],
              ),
              if (trailing != null) trailing!,
            ],
          ),
        );
      },
    );
  }
}
