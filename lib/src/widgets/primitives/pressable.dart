import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';
import 'box.dart';

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
              final mixer = Mixer.build(context, widget.mix);

              final disabled = mixer.disabled;
              final focused = mixer.focused;
              final hovering = mixer.hovering;
              final pressing = mixer.pressing;

              Mix? gestureMix = () {
                if (!enabled && disabled != null) return disabled.mix;
                if (_pressing && pressing != null) return pressing.mix;
                if (_hovering && hovering != null) return hovering.mix;
                if (_shouldShowFocus && focused != null) return focused.mix;
              }();

              final mixer1 = Mixer.build(context, Mix.combine(widget.mix, gestureMix));

              return BoxMixerWidget(
                mixer1,
                child: widget.child,
              );
            }(),
          ),
        ),
      ),
    );
  }
}
