import '../../core/theme/remix_theme.dart';
import 'components/components.dart';
import 'tokens.dart';

class FortalezaThemeData {
  final FortalezaComponentTheme components;
  final FortalezaTokens tokens;

  static final FortalezaThemeData light = FortalezaThemeData(
    components: FortalezaComponentTheme.light,
    tokens: FortalezaTokens.light(),
  );

  static final FortalezaThemeData dark = FortalezaThemeData(
    components: FortalezaComponentTheme.dark,
    tokens: FortalezaTokens.dark(),
  );

  const FortalezaThemeData({required this.components, required this.tokens});

  FortalezaThemeData copyWith({
    FortalezaComponentTheme? components,
    FortalezaTokens? tokens,
  }) {
    return FortalezaThemeData(
      components: components ?? this.components,
      tokens: tokens ?? this.tokens,
    );
  }

  RemixThemeData toThemeData() {
    return RemixThemeData(components: components, tokens: tokens.toThemeData());
  }
}