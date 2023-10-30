import '../../helpers/extensions/string_ext.dart';
import '../attribute.dart';
import 'directive_attribute.dart';

class UppercaseDirective extends TextDirective {
  const UppercaseDirective();

  @override
  String modify(String value) => value.toUpperCase();
}

class CapitalizeDirective extends TextDirective {
  const CapitalizeDirective();

  @override
  String modify(String value) => value.capitalize;
}

class LowercaseDirective extends TextDirective {
  const LowercaseDirective();

  @override
  String modify(String value) => value.toLowerCase();
}

class SentenceCaseDirective extends TextDirective {
  const SentenceCaseDirective();

  @override
  String modify(String value) => value.sentenceCase;
}

class TitleCaseDirective extends TextDirective {
  const TitleCaseDirective();
  @override
  String modify(String value) => value.titleCase;
}

abstract class TextDirective extends Directive<String> {
  const TextDirective();

  @override
  String modify(String value);

  @override
  get props => [modify];
}

class TextDirectiveAttribute
    extends DirectiveAttribute<TextDirective, TextDirectiveAttribute> {
  const TextDirectiveAttribute(super.value);

  @override
  TextDirectiveAttribute create(List<TextDirective> value) {
    return TextDirectiveAttribute(value);
  }
}

abstract class DirectiveAttribute<D extends Directive,
    T extends DirectiveAttribute<D, T>> extends Attribute {
  final List<D> value;
  const DirectiveAttribute(this.value);

  // Create method
  T create(List<D> value);

  @override
  T merge(covariant T? other) {
    if (other == null) return this as T;
    final combinedList = [...value, ...other.value];

    return create(combinedList);
  }

  @override
  get props => [value];
}
