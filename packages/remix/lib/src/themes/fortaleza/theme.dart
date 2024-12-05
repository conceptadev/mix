import '../../core/theme/remix_theme.dart';
import 'components.dart';
import 'tokens.dart';

class FortalezaThemeData extends RemixThemeData {
  factory FortalezaThemeData.light() {
    return FortalezaThemeData(
      components: FortalezaComponentTheme.light(),
      tokens: FortalezaTokens.light().toThemeData(),
    );
  }

  factory FortalezaThemeData.dark() {
    return FortalezaThemeData(
      components: FortalezaComponentTheme.dark(),
      tokens: FortalezaTokens.dark().toThemeData(),
    );
  }

  const FortalezaThemeData({required super.components, required super.tokens});
}
