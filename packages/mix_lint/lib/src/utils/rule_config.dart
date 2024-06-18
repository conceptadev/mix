import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

typedef RuleParameterParser<T> = T Function(Map<String, Object?> json);

typedef RuleProblemFactory<T> = String Function(T value);

class RuleConfig<T extends Object?> {
  RuleConfig({
    required this.name,
    required CustomLintConfigs configs,
    required RuleProblemFactory<T> problemMessage,
    this.url,
    this.correctionMessage,
    this.errorSeverity = ErrorSeverity.INFO,
    RuleParameterParser<T>? paramsParser,
  })  : parameters = paramsParser?.call(configs.rules[name]?.json ?? {}) as T,
        _problemMessageFactory = problemMessage;

  final String name;
  final ErrorSeverity errorSeverity;
  final String? correctionMessage;
  final String? url;

  final T parameters;

  final RuleProblemFactory<T> _problemMessageFactory;

  LintCode get lintCode => LintCode(
        name: name,
        problemMessage: _problemMessageFactory(parameters),
        url: url,
        correctionMessage: correctionMessage,
        errorSeverity: errorSeverity,
      );
}
