part of 'select.dart';

typedef XSelectButtonBuilder = XComponentBuilder<SelectButtonSpec>;
typedef XSelectMenuBuilder = XComponentBuilder<SelectMenuSpec>;

class XSelect extends StatefulWidget {
  const XSelect({
    super.key,
    required this.menu,
    required this.button,
  });

  final XSelectButtonBuilder button;
  final XSelectMenuBuilder menu;

  @override
  State<XSelect> createState() => XSelectState();
}

class XSelectState extends State<XSelect> with SingleTickerProviderStateMixin {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _curvedController = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _curvedController.dispose();
  }

  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          _animationController.forward();
          return Stack(children: [
            GestureDetector(
              onTap: () => hide(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            CompositedTransformFollower(
              link: _link,
              targetAnchor: Alignment.bottomCenter,
              followerAnchor: Alignment.topCenter,
              child: AnimatedBuilder(
                  animation: _curvedController,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.topCenter,
                      scale: lerpDouble(0.95, 1, _curvedController.value),
                      child: Transform.translate(
                        offset: Offset.lerp(
                          Offset(0, -2),
                          Offset(0, 4),
                          _curvedController.value,
                        )!,
                        child: Opacity(
                          opacity: _curvedController.value * 1,
                          child: SpecBuilder(
                            style: XSelectStyle.menu(_link.leaderSize!.width),
                            builder: (context) {
                              return widget.menu(
                                context,
                                SelectSpec.of(context).menu,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ]);
        },
        child: Pressable(
          onPress: onTap,
          child: SpecBuilder(
            style: XSelectStyle.button,
            builder: (context) {
              final button = SelectSpec.of(context).button;
              return widget.button(context, button);
            },
          ),
        ),
      ),
    );
  }

  void show() {
    if (!_tooltipController.isShowing) {
      _tooltipController.show();
    }
  }

  void hide() {
    _animationController.reverse().whenComplete(
          () => _tooltipController.hide(),
        );
  }

  void onTap() {
    if (!_tooltipController.isShowing) {
      show();
    } else {
      hide();
    }
  }
}
