import 'package:widgetbook/widgetbook.dart';

extension WidgetBookStateX on WidgetbookState {
  void updateKnob<T>(String label, T value) {
    updateQueryField(
      group: 'knobs',
      field: label,
      value: '$value',
    );
  }
}
