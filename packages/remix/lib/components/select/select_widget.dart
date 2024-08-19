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

  final baseStyle = XSelectStyle.base.animate(
    curve: Curves.decelerate,
    duration: Durations.short2,
  );

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(),
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
      style: widget._blank ? widget.style : baseStyle.merge(widget.style),
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
                    style: widget._blank ? widget.style : baseStyle,
                    builder: (context) {
                      final select = SelectSpec.of(context);

                      _animationController.duration =
                          select.animated?.duration ??
                              _animationController.duration;

                      final menu = select.menu;

                      final Container = menu.container.copyWith(
                        width: menu.autoWidth ? _link.leaderSize!.width : null,
                      );

                      final Flex = menu.flex;

                      return Container(
                        child: Flex(
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
                                      : baseStyle.merge(widget.style),
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
