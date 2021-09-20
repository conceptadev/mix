import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';

class Box extends MixWidget {
  const Box(
    Mix mix, {
    required this.child,
    Key? key,
  }) : super(mix, key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final mixer = Mixer.build(context, mix);
    return BoxMixerWidget(mixer, child: child);
  }
}

class BoxMixerWidget extends MixerWidget {
  const BoxMixerWidget(
    Mixer mixer, {
    required this.child,
    Key? key,
  }) : super(mixer, key: key);

  final Widget? child;

  EdgeInsetsGeometry? get _paddingIncludingDecoration {
    if (mixer.decoration == null || mixer.decoration!.value.padding == null) {
      return mixer.padding?.value;
    }
    final decorationPadding = mixer.decoration!.value.padding;
    if (mixer.padding == null) return decorationPadding;
    return mixer.padding!.value.add(decorationPadding!);
  }

  @override
  Widget build(BuildContext context) {
    var current = child;

    if (mixer.hidden != null) {
      if (mixer.hidden!.value == true) {
        return const SizedBox.shrink();
      }
    }

    if (child == null &&
        (mixer.constraints == null || !mixer.constraints!.value.isTight)) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      );
    }

    if (mixer.aspectRatio != null) {
      if (mixer.aspectRatio!.hasAnimation) {
        current = TweenAnimationBuilder<double>(
          tween: Tween<double>(end: mixer.aspectRatio!.value),
          duration: mixer.aspectRatio!.animationDuration!,
          curve: mixer.aspectRatio!.animationCurve!,
          onEnd: mixer.aspectRatio!.onEnd,
          builder: (context, value, child) {
            return AspectRatio(aspectRatio: value, child: child);
          },
          child: current,
        );
      } else {
        current = AspectRatio(
          aspectRatio: mixer.aspectRatio!.value,
          child: current,
        );
      }
    }

    if (mixer.alignment != null) {
      if (mixer.alignment!.hasAnimation) {
        current = AnimatedAlign(
          duration: mixer.alignment!.animationDuration!,
          curve: mixer.alignment!.animationCurve!,
          onEnd: mixer.alignment!.onEnd,
          alignment: mixer.alignment!.value,
          child: current,
        );
      } else {
        current = Align(
          alignment: mixer.alignment!.value,
          child: current,
        );
      }
    }

    final effectivePadding = _paddingIncludingDecoration;
    if (effectivePadding != null) {
      if (mixer.padding!.hasAnimation) {
        current = AnimatedPadding(
          duration: mixer.padding!.animationDuration!,
          curve: mixer.padding!.animationCurve!,
          onEnd: mixer.padding!.onEnd,
          padding: effectivePadding,
          child: current,
        );
      } else {
        current = Padding(
          padding: effectivePadding,
          child: current,
        );
      }
    }

    if (mixer.backgroundColor != null) {
      if (mixer.backgroundColor!.hasAnimation) {
        current = TweenAnimationBuilder<Color>(
          duration: mixer.backgroundColor!.animationDuration!,
          curve: mixer.backgroundColor!.animationCurve!,
          onEnd: mixer.backgroundColor!.onEnd,
          tween: Tween<Color>(end: mixer.backgroundColor!.value),
          builder: (context, color, child) {
            return ColoredBox(color: color, child: child);
          },
          child: current,
        );
      } else {
        current = ColoredBox(
          color: mixer.backgroundColor!.value,
          child: current,
        );
      }
    }

    if (mixer.decoration != null) {
      if (mixer.decoration!.hasAnimation) {
        current = TweenAnimationBuilder<Decoration>(
          duration: mixer.decoration!.animationDuration!,
          curve: mixer.decoration!.animationCurve!,
          onEnd: mixer.decoration!.onEnd,
          tween: DecorationTween(end: mixer.decoration!.value),
          builder: (context, value, child) {
            return DecoratedBox(decoration: value, child: child);
          },
          child: current,
        );
      } else {
        current = DecoratedBox(
          decoration: mixer.decoration!.value,
          child: current,
        );
      }
    }

    if (mixer.opacity != null) {
      if (mixer.opacity!.hasAnimation) {
        current = AnimatedOpacity(
          duration: mixer.opacity!.animationDuration!,
          curve: mixer.opacity!.animationCurve!,
          opacity: mixer.opacity!.value,
          onEnd: mixer.opacity!.onEnd,
          child: current,
        );
      } else {
        current = Opacity(
          opacity: mixer.opacity!.value,
          child: current,
        );
      }
    }

    /// Set child constraints
    if (mixer.constraints != null) {
      if (mixer.constraints!.hasAnimation) {
        current = TweenAnimationBuilder<BoxConstraints>(
          duration: mixer.constraints!.animationDuration!,
          curve: mixer.constraints!.animationCurve!,
          onEnd: mixer.constraints!.onEnd,
          tween: BoxConstraintsTween(end: mixer.constraints!.value),
          builder: (context, value, child) {
            return ConstrainedBox(constraints: value, child: child);
          },
          child: current,
        );
      } else {
        current = ConstrainedBox(
          constraints: mixer.constraints!.value,
          child: current,
        );
      }
    }

    if (mixer.maxHeight != null || mixer.maxWidth != null) {
      current = LimitedBox(
        maxHeight: mixer.maxHeight?.value ?? double.infinity,
        maxWidth: mixer.maxWidth?.value ?? double.infinity,
        child: current,
      );
    }

    if (mixer.rotate != null) {
      current = RotatedBox(
        quarterTurns: mixer.rotate!.value,
        child: current,
      );
    }

    if (mixer.margin != null) {
      if (mixer.margin!.hasAnimation) {
        current = AnimatedPadding(
          duration: mixer.margin!.animationDuration!,
          curve: mixer.margin!.animationCurve!,
          onEnd: mixer.margin!.onEnd,
          padding: mixer.margin!.value,
          child: current,
        );
      } else {
        current = Padding(
          padding: mixer.margin!.value,
          child: current,
        );
      }
    }

    if (mixer.flex != null || mixer.flexFit != null) {
      current = Flexible(
        flex: mixer.flex?.value ?? 1,
        fit: mixer.flexFit?.value ?? FlexFit.loose,
        child: current!,
      );
    }

    return current!;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<bool>('display', mixer.hidden?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<double>('aspectRatio', mixer.aspectRatio?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<AlignmentGeometry>(
          'alignment', mixer.alignment?.value,
          showName: false, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>('padding', mixer.padding?.value,
          defaultValue: null),
    );

    if (mixer.backgroundColor != null) {
      properties.add(
        DiagnosticsProperty<Color>(
            'backgroundColor', mixer.backgroundColor?.value),
      );
    } else {
      properties.add(
        DiagnosticsProperty<Decoration>('decoration', mixer.decoration?.value,
            defaultValue: null),
      );
    }

    properties.add(
      DiagnosticsProperty<double>('opacity', mixer.opacity?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<BoxConstraints>(
          'constraints', mixer.constraints?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<double>('maxHeight', mixer.maxHeight?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<double>('maxWidth', mixer.maxWidth?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<int>('rotate', mixer.rotate?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>('margin', mixer.margin?.value,
          defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<int>('flex', mixer.flex?.value, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<FlexFit>('flexFit', mixer.flexFit?.value,
          defaultValue: null),
    );
  }
}
