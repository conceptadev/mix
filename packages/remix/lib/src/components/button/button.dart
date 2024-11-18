import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/theme/remix_theme.dart';
import '../../helpers/component_builder.dart';
import '../spinner/spinner.dart';

part 'button.g.dart';
part 'button_style.dart';
part 'button_widget.dart';

@MixableSpec()
class ButtonSpec extends Spec<ButtonSpec> with _$ButtonSpec, Diagnosticable {
  final FlexBoxSpec container;
  final IconSpec icon;
  final TextSpec label;

  @MixableProperty(dto: MixableFieldDto(type: 'SpinnerSpecAttribute'))
  final SpinnerSpec spinner;

  /// {@macro button_spec_of}
  static const of = _$ButtonSpec.of;

  static const from = _$ButtonSpec.from;

  const ButtonSpec({
    FlexBoxSpec? container,
    IconSpec? icon,
    TextSpec? label,
    super.modifiers,
    SpinnerSpec? spinner,
    super.animated,
  })  : container = container ?? const FlexBoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec(),
        spinner = spinner ?? const SpinnerSpec();

  Widget call({
    Key? key,
    required String label,
    bool disabled = false,
    bool loading = false,
    IconData? iconLeft,
    IconData? iconRight,
    WidgetSpecBuilder<SpinnerSpec>? spinnerBuilder,
    required void Function() onPressed,
  }) {
    return ButtonSpecWidget(
      key: key,
      spec: this,
      label: label,
      disabled: disabled,
      loading: loading,
      iconLeft: iconLeft,
      iconRight: iconRight,
      spinnerBuilder: spinnerBuilder,
      onPressed: onPressed,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
