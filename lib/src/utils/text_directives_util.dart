import '../directives/directive.dart';

/// Directives.
final capitalize = TextDirective([(value) => value.capitalize]);
final uppercase = TextDirective([(value) => value.toUpperCase()]);
final lowercase = TextDirective([(value) => value.toLowerCase()]);

final titleCase = TextDirective([(value) => value.titleCase]);
final sentenceCase = TextDirective([(value) => value.sentenceCase]);
