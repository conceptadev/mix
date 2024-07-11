import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/switch/switch_spec.dart';
import 'package:remix/components/switch/switch_style.dart';
import 'package:remix/components/switch/switch_variants.dart';

class RxSwitch extends StatelessWidget {
  const RxSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = SwitchVariant.solid,
    this.size = SwitchSize.medium,
    this.disabled = false,
    this.style,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final SwitchVariant variant;
  final SwitchSize size;
  final Style? style;
  final bool disabled;

  void _handleOnPress() => onChanged.call(!value);

  Style _buildStyle() {
    return buildSwitchStyle().merge(style).applyVariants([
      size,
      variant,
      value ? SwitchStatus.on : SwitchStatus.off,
    ]).animate();
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: disabled ? null : _handleOnPress,
      enabled: !disabled,
      child: SpecBuilder(
        style: _buildStyle(),
        builder: (context) {
          final spec = SwitchSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;

          return ContainerWidget(
            child: IndicatorWidget(),
          );
        },
      ),
    );
  }
}
