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

  /// The title text displayed in the toast.
  final String title;

  /// The description text displayed below the title.
  final String? description;

  /// Optional widget displayed on the right side of the toast.
  final Widget? trailing;

  /// Optional widget displayed on the left side of the toast.
  final Widget? leading;

  /// {@macro remix.component.style}
  final ToastStyle? style;

  /// {@macro remix.component.variants}
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
          child: spec.layout(
            direction: Axis.horizontal,
            children: [
              if (leading != null) leading!,
              spec.textLayout(
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
