import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/radio/radio_spec.dart';
import 'package:remix/components/radio/radio_style.dart';
import 'package:remix/components/radio/radio_variants.dart';

class RxRadio extends StatelessWidget {
  const RxRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = RadioVariant.solid,
    this.size = RadioSize.medium,
    this.disabled = false,
    this.style,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final RadioVariant variant;
  final RadioSize size;
  final Style? style;
  final bool disabled;

  void _handleOnPress() => onChanged.call(!value);

  Style _buildStyle() {
    return buildDefaultRadioStyle()
        .merge(style)
        .applyVariants([size, variant]).animate();
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: disabled ? null : _handleOnPress,
      enabled: !disabled,
      child: SpecBuilder(
        style: _buildStyle(),
        builder: (context) {
          final spec = RadioSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;

          return ContainerWidget(
            child: value ? IndicatorWidget() : null,
          );
        },
      ),
    );
  }
}
