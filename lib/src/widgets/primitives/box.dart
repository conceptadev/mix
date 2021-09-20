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
      current = AspectRatio(
        aspectRatio: mixer.aspectRatio!.value,
        child: current,
      );
    }

    if (mixer.alignment != null) {
      current = Align(
        alignment: mixer.alignment!.value,
        child: current,
      );
    }

    final effectivePadding = _paddingIncludingDecoration;
    if (effectivePadding != null) {
      current = Padding(
        padding: effectivePadding,
        child: current,
      );
    }

    if (mixer.backgroundColor != null) {
      if (mixer.backgroundColor!.hasAnimation) {
        current = AnimatedContainer(
          duration: mixer.backgroundColor!.animationDuration!,
          curve: mixer.backgroundColor!.animationCurve!,
          color: mixer.backgroundColor!.value,
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
        current = AnimatedContainer(
          duration: mixer.decoration!.animationDuration!,
          curve: mixer.decoration!.animationCurve!,
          decoration: mixer.decoration!.value,
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
        current = AnimatedContainer(
          duration: mixer.constraints!.animationDuration!,
          curve: mixer.constraints!.animationCurve!,
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
      current = Padding(
        padding: mixer.margin!.value,
        child: current,
      );
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
