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
    this.style = const Style.empty(),
  }) : _blank = false;

  const XSelect.blank({
    super.key,
    required this.value,
    required this.onChanged,
    required this.button,
    required this.items,
    required this.style,
  }) : _blank = true;

  final T value;
  final Style style;
  final ValueChanged<T> onChanged;
  final XSelectButtonBuilder button;

  final List<XSelectMenuItem<T>> items;
  final bool _blank;

  @override
  State<XSelect> createState() => XSelectState<T>();
}

class XSelectState<T> extends State<XSelect<T>>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  late final AnimationController _animationController;
  late final MixWidgetStateController _stateController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _stateController = MixWidgetStateController();
    _stateController.selected = false;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _stateController.dispose();
  }

  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style:
          widget._blank ? widget.style : XSelectStyle.base.merge(widget.style),
      builder: (context) {
        final button = SelectSpec.of(context).button;
        final position = SelectSpec.of(context).position;
        return CompositedTransformTarget(
          link: _link,
          child: OverlayPortal(
            controller: _tooltipController,
            overlayChildBuilder: (BuildContext context) {
              return Stack(children: [
                GestureDetector(
                  onTap: () => hide(),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                CompositedTransformFollower(
                  link: _link,
                  targetAnchor:
                      position.targetAnchor.resolve(TextDirection.ltr),
                  followerAnchor:
                      position.followerAnchor.resolve(TextDirection.ltr),
                  child: SpecBuilder(
                    controller: _stateController,
                    style: widget._blank
                        ? widget.style
                        : XSelectStyle.menu(
                            _link.leaderSize!.width,
                          ).merge(widget.style).animate(
                              curve: Curves.decelerate,
                              duration: Duration(milliseconds: 100),
                            ),
                    builder: (context) {
                      final select = SelectSpec.of(context);

                      _animationController.duration =
                          select.animated?.duration ??
                              const Duration(milliseconds: 100);

                      final menu = select.menu;

                      final container = menu.container;
                      final flex = menu.flex;

                      return container(
                        child: flex(
                          direction: Axis.vertical,
                          children: widget.items.map(
                            (item) {
                              return Pressable(
                                onPress: () {
                                  widget.onChanged(item.value);
                                  hide();
                                },
                                child: SpecBuilder(
                                  style: widget._blank
                                      ? widget.style
                                      : XSelectStyle.base.merge(widget.style),
                                  builder: (context) {
                                    return item.child;
                                  },
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ]);
            },
            child: Pressable(
              onPress: onTap,
              child: widget.button(button),
            ),
          ),
        );
      },
    );
  }

  void show() {
    if (!_tooltipController.isShowing) {
      _tooltipController.show();
    }

    _animationController.forward(from: 0.99).whenComplete(() {
      _stateController.selected = true;
    });
  }

  void hide() {
    _stateController.selected = false;

    _animationController.forward(from: 0).whenComplete(() {
      _tooltipController.hide();
    });
  }

  void onTap() {
    if (!_tooltipController.isShowing) {
      show();
    } else {
      hide();
    }
  }
}
