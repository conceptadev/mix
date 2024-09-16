import 'package:mix/mix.dart';
import 'package:widgetbook/widgetbook.dart';

extension KnobsBuilderX on KnobsBuilder {
  Variant variant(List<Variant> variants) => list<Variant>(
        label: 'Variants',
        options: [const Variant('no Variant'), ...variants],
        labelBuilder: (value) => value.name.split('.').last,
      );
}
