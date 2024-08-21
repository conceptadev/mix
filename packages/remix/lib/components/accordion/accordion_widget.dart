part of 'accordion.dart';

typedef RxAccordionHeaderBuilder = Widget Function(
  BuildContext context,
  AccordionHeaderSpec spec,
);

typedef RxAccordionContentBuilder = Widget Function(
  BuildContext context,
  TextSpec spec,
);

class XAccordion extends StatefulWidget {
  const XAccordion({
    super.key,
    required this.header,
    required this.content,
    this.initiallyExpanded = false,
    this.style = const Style.empty(),
  }) : _blank = false;

  const XAccordion.blank({
    super.key,
    required this.header,
    required this.content,
    this.initiallyExpanded = false,
    required this.style,
  }) : _blank = true;

  final RxAccordionHeaderBuilder header;
  final RxAccordionContentBuilder content;
  final Style style;
  final bool initiallyExpanded;

  final bool _blank;

  @override
  State<XAccordion> createState() => _XAccordionState();
}

class _XAccordionState extends State<XAccordion> with TickerProviderStateMixin {
  late final MixWidgetStateController _stateController;

  @override
  void initState() {
    super.initState();

    _stateController = MixWidgetStateController()
      ..selected = widget.initiallyExpanded;
  }

  void _handleTap() {
    _stateController.selected = !_stateController.selected;
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SpecBuilder(
        controller: _stateController,
        style: widget._blank
            ? widget.style
            : AccordionStyle.base
                .merge(widget.style)
                .animate(curve: Curves.decelerate),
        builder: (context) {
          final spec = AccordionSpec.of(context);

          final ContainerWidget = spec.container;
          final specContentContainer = spec.contentContainer;
          final FlexWidget = spec.flex;

          final content = BoxSpecWidget(
            spec: specContentContainer,
            child: widget.content(context, spec.textContent),
          );

          return ContainerWidget(
            child: FlexWidget(
              direction: Axis.vertical,
              children: [
                Pressable(
                  onPress: _handleTap,
                  child: widget.header(context, spec.header),
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
