import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.widget.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
import '../mix_widget.dart';

class Pressable extends MixWidget {
  const Pressable(
    Mix mix, {
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.autofocus = false,
    this.behavior,
    Key? key,
  }) : super(mix, key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final HitTestBehavior? behavior;

  @override
  Widget build(BuildContext context) {
    return PressableMixerWidget(
      mix,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      child: child,
    );
  }
}

class PressableMixerWidget extends StatefulWidget {
  const PressableMixerWidget(
    this.mix, {
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.autofocus = false,
    this.behavior,
    Key? key,
  }) : super(key: key);

  final Mix mix;

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autofocus;

  final HitTestBehavior? behavior;

  @override
  _PressableMixerWidgetState createState() => _PressableMixerWidgetState();
}

class _PressableMixerWidgetState extends State<PressableMixerWidget> {
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    node = widget.focusNode ?? _createFocusNode();
  }

  @override
  void didUpdateWidget(PressableMixerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      node = widget.focusNode ?? node;
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) node.dispose();
    super.dispose();
  }

  FocusNode _createFocusNode() {
    return FocusNode(debugLabel: '${widget.runtimeType}');
  }

  bool _hovering = false;
  bool _pressing = false;
  bool _shouldShowFocus = false;

  bool get enabled => widget.onPressed != null || widget.onLongPressed != null;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        button: true,
        enabled: enabled,
        focusable: enabled && node.canRequestFocus,
        focused: node.hasFocus,
        child: FocusableActionDetector(
          focusNode: node,
          autofocus: widget.autofocus,
          enabled: enabled,
          onShowFocusHighlight: (v) {
            if (mounted) setState(() => _shouldShowFocus = v);
          },
          onShowHoverHighlight: (v) {
            if (mounted) setState(() => _hovering = v);
          },
          child: GestureDetector(
            behavior: widget.behavior,
            onTap: widget.onPressed,
            onTapDown: (_) {
              if (mounted) setState(() => _pressing = true);
            },
            onTapUp: (_) async {
              if (!enabled) return;
              await Future.delayed(const Duration(milliseconds: 100));
              if (mounted) setState(() => _pressing = false);
            },
            onTapCancel: () {
              if (mounted) setState(() => _pressing = false);
            },
            onLongPressStart: (_) {
              if (mounted) setState(() => _pressing = true);
            },
            onLongPressEnd: (_) {
              if (mounted) setState(() => _pressing = false);
            },
            child: () {
              final mixer = Recipe.build(context, widget.mix);

              return PressableNotifier(
                disabled: !enabled,
                focused: _shouldShowFocus,
                hovering: _hovering,
                pressing: _pressing,
                child: BoxMixerWidget(
                  recipe: mixer,
                  child: widget.child,
                ),
              );
            }(),
          ),
        ),
      ),
    );
  }
}

class PressableNotifier extends InheritedWidget {
  const PressableNotifier({
    Key? key,
    required Widget child,
    this.hovering = false,
    this.pressing = false,
    this.focused = false,
    this.disabled = false,
  }) : super(key: key, child: child);

  final bool hovering;
  final bool pressing;
  final bool focused;
  final bool disabled;

  bool get isNone => !hovering && !pressing && !focused && !disabled;

  static PressableNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PressableNotifier>();
  }

  @override
  bool updateShouldNotify(PressableNotifier oldWidget) {
    return hovering != oldWidget.hovering ||
        pressing != oldWidget.pressing ||
        focused != oldWidget.focused ||
        disabled != oldWidget.disabled;
  }
}
