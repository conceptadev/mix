import '../../factory/style_mix.dart';
import 'style_mix_attribute.dart';

const apply = StyleMixUtility();

class StyleMixUtility {
  const StyleMixUtility();

  StyleMixAttribute _applyStyle(List<StyleMix> mixes) {
    return StyleMixAttribute(StyleMix.combine(mixes));
  }

  StyleMixAttribute list(List<StyleMix> mixes) {
    return _applyStyle(mixes);
  }

  StyleMixAttribute call(
    StyleMix style, [
    StyleMix? style2,
    StyleMix? style3,
    StyleMix? style4,
    StyleMix? style5,
    StyleMix? style6,
  ]) {
    final styles = [style, style2, style3, style4, style5, style6]
        .whereType<StyleMix>()
        .toList();

    return _applyStyle(styles);
  }
}
