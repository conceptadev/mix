import 'package:flutter/material.dart';

import '../../../mix.dart';

class GestureBox extends StatelessWidget {
  const GestureBox({
    required this.child,
    this.onTap,
    this.mix = Mix.constant,
    this.onLongPressed,
    this.focusNode,
    this.autofocus = false,
    this.behavior,
    Key? key,
  }) : super(key: key);

  final MixableWidget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final HitTestBehavior? behavior;

  final Mix mix;

  @override
  Widget build(BuildContext context) {
    return GestureBoxMixerWidget(
      onTap: onTap,
      onLongPress: onLongPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      mix: mix,
      child: child,
    );
  }
}

/// @nodoc
class GestureBoxMixerWidget extends StatefulWidget {
  const GestureBoxMixerWidget({
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.behavior,
    this.mix = Mix.constant,
    Key? key,
  }) : super(key: key);

  final MixableWidget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Mix mix;

  final HitTestBehavior? behavior;

  @override
  GestureBoxMixerWidgetState createState() => GestureBoxMixerWidgetState();
}

class GestureBoxMixerWidgetState extends State<GestureBoxMixerWidget> {
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    node = widget.focusNode ?? _createFocusNode();
  }

  @override
  void didUpdateWidget(GestureBoxMixerWidget oldWidget) {
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
  bool _onShouldShowFocus = false;
  bool _onTap = false;
  bool _onLongPress = false;

  bool get enabled => widget.onTap != null || widget.onLongPress != null;

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
        child: FocusableActionDetector(
          focusNode: node,
          autofocus: widget.autofocus,
          enabled: enabled,
          onShowFocusHighlight: (v) {
            updateState(() => _onShouldShowFocus = v);
          },
          onShowHoverHighlight: (v) {
            updateState(() => _onHover = v);
          },
          child: GestureDetector(
            behavior: widget.behavior,
            onTap: () {
              widget.onTap?.call();
            },
            onTapDown: (_) {
              updateState(() => _onTap = true);
            },
            onTapUp: (_) {
              updateState(() => _onTap = false);
            },
            onTapCancel: () {
              updateState(() => _onTap = false);
            },
            onLongPressStart: (_) {
              updateState(() => _onTap = true);
              updateState(() => _onLongPress = true);
            },
            onLongPressEnd: (_) {
              updateState(() => _onLongPress = false);
              updateState(() => _onTap = false);
            },
            child: Box(
              mix: widget.mix.withManyVariants([
                if (_onHover) onHover,
                if (_onTap) onTap,
                if (_onShouldShowFocus) onFocus,
                if (_onLongPress) onLongPress,
                if (!enabled) onDisabled,
              ]),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
