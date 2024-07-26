import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'flutter_animate.g.dart';

@MixableSpec(prefix: '_FlutterAnimateModifierSpec')
class FlutterAnimateModifierSpec
    extends WidgetModifierSpec<FlutterAnimateModifierSpec>
    with _$FlutterAnimateModifierSpec {
  const FlutterAnimateModifierSpec({
    this.effects,
    this.autoPlay,
    this.delay,
    this.value,
    this.target,
  });

  final List<Effect<dynamic>>? effects;
  final bool? autoPlay;
  final Duration? delay;
  final double? value;
  final double? target;

  @override
  Widget build(Widget child) {
    return child.animate(effects: effects, autoPlay: autoPlay, delay: delay);
  }
}

class FlutterAnimateAttribute extends _FlutterAnimateModifierSpecAttribute
    implements AnimateManager<FlutterAnimateAttribute> {
  @override
  FlutterAnimateAttribute addEffect(Effect effect) => addEffects([effect]);
  @override
  FlutterAnimateAttribute addEffects(List<Effect> effects) {
    return FlutterAnimateAttribute(
      effects: [...(this.effects ?? []), ...effects],
      autoPlay: autoPlay,
      delay: delay,
      value: value,
      target: target,
    );
  }

  const FlutterAnimateAttribute({
    super.autoPlay,
    super.delay,
    super.effects,
    super.value,
    super.target,
  });
}

class FlutterAnimateUtility<T extends Attribute>
    extends MixUtility<T, FlutterAnimateAttribute> with AnimateManager<T> {
  @override
  T addEffect(Effect effect) => call(effects: [effect]);

  static final self = FlutterAnimateUtility((v) => v);

  /// Returns a new [FlutterAnimateModifierSpecAttribute] with the specified properties.
  T call({
    List<Effect<dynamic>>? effects,
    bool? autoPlay,
    Duration? delay,
    double? value,
    double? target,
  }) {
    return builder(FlutterAnimateAttribute(
      effects: effects,
      autoPlay: autoPlay,
      delay: delay,
      value: value,
      target: target,
    ));
  }

  const FlutterAnimateUtility(super.builder);
}

extension TextSpecUtilityX<T extends Attribute> on TextSpecUtility<T> {
  FlutterAnimateUtility<T> get animate => FlutterAnimateUtility((v) {
        return only(modifiers: WidgetModifiersDataDto([v]));
      });
}
