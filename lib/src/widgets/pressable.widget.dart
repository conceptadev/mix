import 'package:flutter/material.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/attributes/pressable/pressable.notifier.dart';

import '../mixer/mix_factory.dart';
import 'box.widget.dart';
import 'mixable.widget.dart';

/// The _Mixable_ corollary to the Flutter _Button_ class
/// Use anywhere you would use a _Button_
///
/// {@category Mixable Widgets}
class Pressable extends MixableWidget {
  const Pressable({
    Mix? mix,
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.variant,
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
  final Variant? variant;

  @override
  Widget build(BuildContext context) {
    return PressableMixerWidget(
      mix,
      variant: variant,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      child: child,
    );
  }
}

/// @nodoc
class PressableMixerWidget extends StatefulWidget {
  const PressableMixerWidget(
    this.mix, {
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.focusNode,
    this.variant,
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
  final Variant? variant;

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
              return PressableNotifier(
                disabled: !enabled,
                focused: _shouldShowFocus,
                hovering: _hovering,
                pressing: _pressing,
                child: Box(
                  mix: widget.mix,
                  variant: widget.variant,
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
