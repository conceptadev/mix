part of 'dropdown_menu.dart';

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({
    super.key,
    this.variants = const [],
    this.style,
    required this.trigger,
    required this.items,
    this.offset = const Offset(0, 4),
    this.targetAnchor = Alignment.bottomCenter,
    this.followerAnchor = Alignment.topCenter,
  });

  /// {@macro remix.component.style}
  final DropdownMenuStyle? style;

  /// {@macro remix.component.variants}
  final List<Variant> variants;

  /// The trigger widget that opens the dropdown menu.
  /// It is a builder that returns a widget and a callback to open the menu
  final Widget Function(VoidCallback action) trigger;

  /// The list of items to display in the dropdown menu.
  /// Each item contains a value and widget to display.
  final List<DropdownMenuItem> items;

  /// The offset of the dropdown menu relative to the trigger widget.
  final Offset offset;

  /// The anchor point on the trigger widget that the dropdown menu should be aligned to.
  final Alignment targetAnchor;

  /// The anchor point on the dropdown menu that the trigger widget should be aligned to.
  final Alignment followerAnchor;

  @override
  State<DropdownMenu> createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late final MixWidgetStateController _menuStateController;

  final _link = LayerLink();

  @override
  void initState() {
    super.initState();

    _menuStateController = MixWidgetStateController()..selected = false;
  }

  @override
  void dispose() {
    _menuStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.dropdownMenu;
    final configuration =
        SpecConfiguration(context, DropdownMenuSpecUtility.self);
    final appliedStyle =
        style.makeStyle(configuration).applyVariants(widget.variants);

    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return Stack(children: [
            GestureDetector(
              onTap: () => hide(),
              child: Container(color: Colors.transparent),
            ),
            CompositedTransformFollower(
              link: _link,
              offset: widget.offset,
              targetAnchor: widget.targetAnchor,
              followerAnchor: widget.followerAnchor,
              child: SpecBuilder(
                controller: _menuStateController,
                style: appliedStyle,
                builder: (context) {
                  final menu = DropdownMenuSpec.of(context).menu;

                  final FlexContainer = menu.container.copyWith(
                    box: menu.container.box.copyWith(
                      width: menu.autoWidth ? _link.leaderSize!.width : null,
                    ),
                  );

                  final AnimatedStyle? animatedStyle =
                      appliedStyle is AnimatedStyle ? appliedStyle : null;

                  return AnimatedBoxSpecWidget(
                    spec: FlexContainer.box,
                    duration: animatedStyle?.animated.duration ?? Duration.zero,
                    curve: animatedStyle?.animated.curve ?? Curves.easeInOut,
                    onEnd: () {
                      if (_menuStateController.selected == false) {
                        _tooltipController.hide();
                      }
                    },
                    child: FlexContainer.flex(
                      direction: Axis.vertical,
                      children: List.generate(widget.items.length, (index) {
                        final item = widget.items[index];

                        return item;
                      }),
                    ),
                  );
                },
              ),
            ),
          ]);
        },
        child: RepaintBoundary(child: widget.trigger(onTap)),
      ),
    );
  }

  void show() {
    if (!_tooltipController.isShowing) {
      _tooltipController.show();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _menuStateController.selected = true;
    });
  }

  void hide() {
    _menuStateController.selected = false;
  }

  void onTap() {
    if (!_tooltipController.isShowing) {
      show();
    } else {
      hide();
    }
  }
}
