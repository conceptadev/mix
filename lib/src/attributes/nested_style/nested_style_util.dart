import '../../factory/style_mix.dart';
import 'nested_style_attribute.dart';

const apply = NestedStyleUtility();

class NestedStyleUtility {
  const NestedStyleUtility();

  NestedStyleAttribute _applyStyle(List<Style> mixes) {
    return NestedStyleAttribute(Style.combine(mixes));
  }

  NestedStyleAttribute list(List<Style> mixes) {
    return _applyStyle(mixes);
  }

  NestedStyleAttribute call(
    Style style, [
    Style? style2,
    Style? style3,
    Style? style4,
    Style? style5,
    Style? style6,
  ]) {
    final styles = [style, style2, style3, style4, style5, style6].whereType<Style>().toList();

    return _applyStyle(styles);
  }
}
