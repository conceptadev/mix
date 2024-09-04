part of 'accordion.dart';

typedef XAccordionHeaderBuilder = XComponentBuilder<AccordionHeaderSpec>;
typedef XAccordionContentBuilder = XComponentBuilder<TextSpec>;

final Variant openedVariant = const Variant('accordion.opened');

class XAccordion extends StatefulWidget {
  const XAccordion({
    super.key,
    required this.header,
    required this.content,
    this.variants = const [],
    this.initiallyExpanded = false,
    this.style = const Style.empty(),
  });

  final XAccordionHeaderBuilder header;
  final XAccordionContentBuilder content;
  final Style style;
  final bool initiallyExpanded;
  final List<Variant> variants;

  @override
  State<XAccordion> createState() => _XAccordionState();
}

class _XAccordionState extends State<XAccordion> with TickerProviderStateMixin {
  late bool opened = widget.initiallyExpanded;

  void _handleTap() {
    setState(() {
      opened = !opened;
    });
  }

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.accordion;

    final style = (styleFromTheme ?? XAccordionStyle.base)
        .merge(widget.style)
        .applyVariant(opened ? openedVariant : null)
        .applyVariants(widget.variants);

    return RepaintBoundary(
      child: SpecBuilder(
        style: style,
        builder: (context) {
          final spec = AccordionSpec.of(context);

          final ContainerWidget = spec.container;
          final specContentContainer = spec.contentContainer;
          final FlexWidget = spec.flex;

          final content = BoxSpecWidget(
            spec: specContentContainer,
            child: widget.content(spec.textContent),
          );

          return ContainerWidget(
            child: FlexWidget(
              direction: Axis.vertical,
              children: [
                Pressable(
                  onPress: _handleTap,
                  child: SpecBuilder(
                    style: style,
                    builder: (context) {
                      final spec = AccordionSpec.of(context);

                      return widget.header(spec.header);
                    },
                  ),
                ),
                content,
              ],
            ),
          );
        },
      ),
    );
  }
}
