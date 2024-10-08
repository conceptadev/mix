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

  /// The list of child widgets to be displayed inside the card.

  final WidgetSpecBuilder<TextSpec>? titleBuilder;
  final WidgetSpecBuilder<TextSpec>? descriptionBuilder;
  final Widget? content;
  final List<Widget>? actions;

  /// Additional custom styling for the card.
  ///
  /// This allows you to override or extend the default card styling.
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
            direction: Axis.vertical,
            children: [
              if (titleBuilder != null) titleBuilder!(spec.title),
              if (descriptionBuilder != null)
                descriptionBuilder!(spec.description),
              content ?? const SizedBox.shrink(),
              if (actions != null)
                spec.actionsFlex(
                  direction: Axis.horizontal,
                  children: actions!,
                ),
            ],
          ),
        );
      },
    );
  }
}

// class DialogSpecWidget extends StatelessWidget {
//   const DialogSpecWidget({
//     super.key,
//     required this.spec,
//     required this.children,
//   });

//   final DialogSpec? spec;
//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return spec!.container(
//       child: spec!.flex(direction: Axis.vertical, children: children),
//     );
//   }
// }
