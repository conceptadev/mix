import 'package:mix/mix.dart';

import 'translate/tw_target.dart' as target;
import 'translate/tw_translator.dart';
import 'tw_config.dart';
import 'tw_types.dart';
import 'tw_utils.dart';

class TwParser {
  factory TwParser({
    TwConfig? config,
    TwDiagnosticCallback? onDiagnostic,
    @Deprecated('Use onDiagnostic instead.')
    void Function(String token)? onUnsupported,
  }) {
    final resolvedConfig = config ?? TwConfig.standard();
    return TwParser._(
      config: resolvedConfig,
      translator: TwTranslator(
        config: resolvedConfig,
        onDiagnostic: onDiagnostic,
        legacyOnUnsupported: onUnsupported,
      ),
      onDiagnostic: onDiagnostic,
      onUnsupported: onUnsupported,
    );
  }

  TwParser._({
    required this.config,
    required TwTranslator translator,
    this.onDiagnostic,
    this.onUnsupported,
  }) : _translator = translator;

  final TwConfig config;
  final TwDiagnosticCallback? onDiagnostic;

  @Deprecated('Use onDiagnostic instead.')
  final void Function(String token)? onUnsupported;
  final TwTranslator _translator;

  List<String> listTokens(String classNames) => splitTailwindTokens(classNames);

  Set<String> setTokens(String classNames) => listTokens(classNames).toSet();

  bool wantsFlex(Set<String> tokens) =>
      target.wantsFlex(tokens, breakpoints: config.breakpoints);

  FlexBoxStyler parseFlex(String classNames) =>
      _translator.translateFlex(classNames);

  BoxStyler parseBox(String classNames) => _translator.translateBox(classNames);

  TextStyler parseText(String classNames) =>
      _translator.translateText(classNames);

  IconStyler parseIcon(String classNames) =>
      _translator.translateIcon(classNames);

  CurveAnimationConfig? parseAnimationFromTokens(List<String> tokens) =>
      _translator.parseAnimationFromTokens(tokens);
}
