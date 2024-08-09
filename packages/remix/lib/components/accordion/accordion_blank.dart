part of 'accordion.dart';

typedef RxAccordionHeaderBuilder = Widget Function(
  BuildContext context,
  AccordionHeaderSpec spec,
);

typedef RxAccordionContentBuilder = Widget Function(
  BuildContext context,
  TextSpec spec,
);

class RxBlankAccordion extends StatefulWidget {
  const RxBlankAccordion({
    super.key,
    required this.header,
    required this.content,
    this.initiallyExpanded = false,
    required this.style,
  });

  final RxAccordionHeaderBuilder header;
  final RxAccordionContentBuilder content;
  final Style style;
  final bool initiallyExpanded;

  @override
  State<RxBlankAccordion> createState() => _RxBlankAccordionState();
}

class _RxBlankAccordionState extends State<RxBlankAccordion>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController? _animationController;
  CurvedAnimation? _curvedAnimation;
  MixWidgetStateController? _stateController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Durations.short4,
      vsync: this,
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.decelerate,
    );

    _isExpanded = widget.initiallyExpanded;
    _stateController = MixWidgetStateController()..selected = _isExpanded;
    _animationController!.value = _isExpanded ? 1 : 0;
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      _stateController!.selected = _isExpanded;

      if (_isExpanded) {
        _animationController!.forward();
      } else {
        _animationController!.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _curvedAnimation!.dispose();
    _stateController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SpecBuilder(
        controller: _stateController,
        style: widget.style,
        builder: (context) {
          final spec = AccordionSpec.of(context);

          final ContainerWidget = spec.container;
          final ContentContainerWidget = spec.contentContainer;
          final FlexWidget = spec.flex;

          final content = ContentContainerWidget(
            child: widget.content(
              context,
              spec.textContent,
            ),
          );

          return ContainerWidget(
            child: FlexWidget(
              direction: Axis.vertical,
              children: [
                Pressable(
                  onPress: _handleTap,
                  child: widget.header(context, spec.header),
                ),
                AnimatedBuilder(
                  animation: _animationController!.view,
                  builder: (context, child) {
                    return ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: _curvedAnimation!.value,
                        child: child,
                      ),
                    );
                  },
                  child: Offstage(
                    child: content,
                    offstage: !_isExpanded && _curvedAnimation!.isCompleted,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
