import 'package:flutter/material.dart';

import '../../../mix.dart';

/// @nodoc
class GestureBox extends StatefulWidget {
  const GestureBox({
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.behavior,
    this.mix = Mix.constant,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Mix mix;

  final HitTestBehavior? behavior;

  @override
  GestureBoxState createState() => GestureBoxState();
}

class GestureBoxState extends State<GestureBox> {
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    node = widget.focusNode ?? _createFocusNode();
  }

  @override
  void didUpdateWidget(GestureBox oldWidget) {
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

  bool _onHover = false;
  bool _onFocus = false;
  bool _onPress = false;
  bool _onLongPress = false;

  bool get enabled => widget.onTap != null || widget.onLongPress != null;

  void unpress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_onPress) {
        updateState(() => _onPress = false);
      }
    });
  }

  updateState(void Function() fn) {
    if (mounted) setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        button: true,
        enabled: enabled,
        focusable: enabled && node.canRequestFocus,
        focused: node.hasFocus,
        child: GestureDetector(
          behavior: widget.behavior,
          onTap: () {
            widget.onTap?.call();
          },
          onTapDown: (_) {
            updateState(() => _onPress = true);
          },
          onTapUp: (_) {
            unpress();
          },
          onTapCancel: () {
            unpress();
          },
          onLongPress: widget.onLongPress,
          onLongPressStart: (_) {
            updateState(() => _onLongPress = true);
          },
          onLongPressEnd: (_) {
            updateState(() => _onLongPress = false);
          },
          child: FocusableActionDetector(
            focusNode: node,
            autofocus: widget.autofocus,
            enabled: enabled,
            onShowFocusHighlight: (v) {
              updateState(() => _onFocus = v);
            },
            onShowHoverHighlight: (v) {
              updateState(() => _onHover = v);
            },
            child: Box(
              mix: widget.mix.withManyVariants([
                if (!enabled) onDisabled,
                if (_onFocus) onFocus,
                if (_onHover) onHover,
                if (_onPress) onPress,
                if (_onLongPress) onLongPress,
              ]),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
