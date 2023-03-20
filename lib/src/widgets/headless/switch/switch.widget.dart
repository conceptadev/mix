import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../../../mix.dart';
import '../../../theme/mix_tokens.dart';
import '../../../variants/context_variant.dart';

part 'switch.notifier.dart';
part 'switch.variants.dart';
part 'switch_thumb.widget.dart';
part 'switch_track.widget.dart';

const _kDefaultAnimationDuration = 200;

/// A switch widget that can be used to toggle between two states.
/// The switch can be customized using the [track] and [thumb] properties.
///
/// The [track] and [thumb] properties can be used to customize the switch by their mix property,
/// in different states, using the [onActive], [onNotActive] and all others [Pressable] variants.
class SwitchX extends StatefulWidget {
  /// The initial state of the switch.
  final bool value;

  /// A callback function that will be called whenever the switch is toggled.
  final ValueChanged<bool>? onChange;

  /// The duration of the animation when the switch is toggled.
  final Duration animationDuration;

  /// The curve of the animation when the switch is toggled.
  final Curve animationCurve;

  /// The track of the switch (thumb background).
  final SwitchXTrack track;

  /// The thumb of the switch.
  final SwitchXThumb thumb;

  const SwitchX({
    Key? key,
    this.value = false,
    this.onChange,
    this.track = const SwitchXTrack(),
    this.thumb = const SwitchXThumb(),
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(
      milliseconds: _kDefaultAnimationDuration,
    ),
  }) : super(key: key);

  @override
  SwitchXState createState() => SwitchXState();
}

class SwitchXState extends State<SwitchX> with SingleTickerProviderStateMixin {
  late bool _value = widget.value;
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedAnimation;
  late final Animation<Alignment> _thumbAnimation = _value //
      ? AlignmentTween(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ).animate(_curvedAnimation)
      : AlignmentTween(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).animate(_curvedAnimation);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Handles the switch toggle.
  void _handleOnChange() {
    setState(() {
      _value = !_value;

      _value == widget.value //
          ? _animationController.reverse()
          : _animationController.forward();
    });

    widget.onChange?.call(_value);
  }

  @override
  Widget build(BuildContext context) {
    final trackSize = widget.track.size;
    final thumbSize = widget.thumb.size;

    final maxWidth = max(trackSize.width, thumbSize.width);
    final maxHeight = max(trackSize.height, thumbSize.height);

    final zBoxMix = Mix(
      width(maxWidth),
      height(maxHeight),
      zAlign(Alignment.center),
    );

    return MergeSemantics(
      child: Semantics(
        toggled: _value,
        checked: _value,
        textDirection: TextDirection.ltr,
        attributedValue: _value //
            ? AttributedString('on')
            : AttributedString('off'),
        child: SwitchXNotifier(
          active: _value,
          child: Pressable(
            onPressed: widget.onChange == null ? null : _handleOnChange,
            child: ZBox(
              mix: zBoxMix,
              children: [
                widget.track,
                AnimatedBuilder(
                  animation: _thumbAnimation,
                  builder: (context, child) {
                    return Align(
                      alignment: _thumbAnimation.value,
                      child: widget.thumb,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
