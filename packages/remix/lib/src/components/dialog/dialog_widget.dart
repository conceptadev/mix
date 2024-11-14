part of 'dialog.dart';

class Dialog extends StatelessWidget {
  Dialog({
    super.key,
    required String title,
    required String description,
    this.actions,
    this.content,
    this.style,
    this.variants = const [],
  })  : titleBuilder = ((spec) => spec(title)),
        descriptionBuilder = ((spec) => spec(description));

  const Dialog.builders({
    super.key,
    this.titleBuilder,
    this.descriptionBuilder,
    this.actions,
    this.content,
    this.style,
    this.variants = const [],
  });

  final WidgetSpecBuilder<TextSpec>? titleBuilder;
  final WidgetSpecBuilder<TextSpec>? descriptionBuilder;
  final Widget? content;
  final List<Widget>? actions;
  final DialogStyle? style;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.dialog;

    final configuration = SpecConfiguration(context, DialogSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
      builder: (context) {
        final spec = DialogSpec.of(context);

        return spec.container(
          child: spec.mainFlex(
            children: [
              if (titleBuilder != null) titleBuilder!(spec.title),
              if (descriptionBuilder != null)
                descriptionBuilder!(spec.description),
              content ?? const SizedBox.shrink(),
              if (actions != null)
                spec.actionsFlex(
                  children: actions!,
                  direction: Axis.horizontal,
                ),
            ],
            direction: Axis.vertical,
          ),
        );
      },
    );
  }
}
