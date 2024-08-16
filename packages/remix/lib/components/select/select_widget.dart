part of 'select.dart';

typedef XSelectButtonBuilder = XComponentBuilder<SelectButtonSpec>;
typedef XSelectMenuBuilder = XComponentBuilder<SelectMenuSpec>;

class XSelectMenuItem<T> {
  const XSelectMenuItem({
    required this.value,
    required this.child,
  });

  final T value;
  final Widget child;
}

class XSelect<T> extends StatefulWidget {
  const XSelect({
    super.key,
    required this.value,
    required this.onChanged,
    required this.button,
    required this.items,
  });

  final T value;
  final ValueChanged<T> onChanged;
  final XSelectButtonBuilder button;
  final XSelectMenuItemBuilder<T> items;

  @override
  State<XSelect> createState() => XSelectState<T>();
}

class XSelectState<T> extends State<XSelect<T>>
    with SingleTickerProviderStateMixin {
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
                              final menu = SelectSpec.of(context).menu;
                              final item = SelectSpec.of(context).item;

                              final container = menu.container;
                              final flex = menu.flex;

                              return container(
                                child: flex(
                                  direction: Axis.vertical,
                                  children: widget.items(context, item).map(
                                    (item) {
                                      return Pressable(
                                        onPress: () {
                                          widget.onChanged(item.value);
                                          hide();
                                        },
                                        child: item.child,
                                      );
                                    },
                                  ).toList(),
                                ),
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
