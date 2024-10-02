import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../../mix.dart';

part 'text_height_behavior_dto.g.dart';

@MixableDto(generateUtility: false)
base class TextHeightBehaviorDto extends Dto<TextHeightBehavior>
    with _$TextHeightBehaviorDto, Diagnosticable {
  final bool? applyHeightToFirstAscent;
  final bool? applyHeightToLastDescent;
  final TextLeadingDistribution? leadingDistribution;

  const TextHeightBehaviorDto({
    this.applyHeightToFirstAscent,
    this.applyHeightToLastDescent,
    this.leadingDistribution,
  });

  @override
  TextHeightBehavior get defaultValue => const TextHeightBehavior();
}

final class TextHeightBehaviorUtility<T extends Attribute>
    extends DtoUtility<T, TextHeightBehaviorDto, TextHeightBehavior> {
  late final heightToFirstAscent = BoolUtility(
    (v) => only(applyHeightToFirstAscent: v),
  );
  late final heightToLastDescent = BoolUtility(
    (v) => only(applyHeightToLastDescent: v),
  );

  TextHeightBehaviorUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  T leadingDistribution(TextLeadingDistribution distribution) => builder(
        TextHeightBehaviorDto(leadingDistribution: distribution),
      );

  @Deprecated("Use the utilities instead")
  T call(TextHeightBehavior value) => builder(value.toDto());

  @override
  T only({
    bool? applyHeightToFirstAscent,
    bool? applyHeightToLastDescent,
    TextLeadingDistribution? leadingDistribution,
  }) =>
      builder(
        TextHeightBehaviorDto(
          applyHeightToFirstAscent: applyHeightToFirstAscent,
          applyHeightToLastDescent: applyHeightToLastDescent,
          leadingDistribution: leadingDistribution,
        ),
      );
}
