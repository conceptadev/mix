import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('TextDirectiveAttribute', () {
    String uppercaseFn(value) => value.toUpperCase();
    String lowercaseFn(value) => value.toLowerCase();
    test('merge returns merged object correctly', () {
      final attr1 = uppercase();
      final attr2 = capitalize();
      final merged = attr1.merge(attr2);
      expect(merged.directives?.length, 2);
    });
    test('resolve returns correct TextDirective with default values', () {
      const attr = TextMixAttribute(directives: []);

      expect(attr.directives, []);
    });

    test('Equality holds when all properties are the same', () {
      final attr1 = TextMixAttribute(directives: [TextDirective(uppercaseFn)]);
      final attr2 = TextMixAttribute(directives: [TextDirective(uppercaseFn)]);
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = TextMixAttribute(directives: [TextDirective(uppercaseFn)]);
      final attr2 = TextMixAttribute(directives: [TextDirective(lowercaseFn)]);
      expect(attr1, isNot(attr2));
    });

    group('UppercaseDirective', () {
      test('modify returns correct value', () {
        final attribute = uppercase();
        final modified = attribute.directives!.first('hello');
        expect(modified, 'HELLO');
      });
    });

    group('CapitalizeDirective', () {
      test('modify returns correct value', () {
        final attribute = capitalize();
        final modified = attribute.directives!.first('hello');
        expect(modified, 'Hello');
      });
    });

    group('LowercaseDirective', () {
      test('modify returns correct value', () {
        final attribute = lowercase();
        final modified = attribute.directives!.first('HELLO');
        expect(modified, 'hello');
      });
    });

    group('SentenceCaseDirective', () {
      test('modify returns correct value', () {
        final attribute = sentenceCase();
        final modified = attribute.directives!.first('hello');
        expect(modified, 'Hello');
      });
    });

    group('TitleCaseDirective', () {
      test('modify returns correct value', () {
        final attribute = titleCase();
        final modified = attribute.directives!.first('hello');
        expect(modified, 'Hello');
      });
    });

    group('TextDirective', () {
      test('Equality holds when all properties are the same', () {
        final attr1 = uppercase();
        final attr2 = uppercase();
        expect(attr1, attr2);
      });
      test('Equality fails when properties are different', () {
        final attr1 = uppercase();
        final attr2 = lowercase();
        expect(attr1, isNot(attr2));
      });
    });
  });
}
