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
      expect(merged.value.length, 2);
    });
    test('resolve returns correct TextDirective with default values', () {
      const attr = TextDirectiveAttribute.raw([]);

      expect(attr.value, []);
    });
    test('resolve returns correct TextDirective with specific values', () {
      final attr = TextDirectiveAttribute.raw(
          [...uppercase().value, ...capitalize().value]);

      expect(attr.value, [
        ...uppercase().value,
        ...capitalize().value,
      ]);
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = TextDirectiveAttribute.raw([TextDirective(uppercaseFn)]);
      final attr2 = TextDirectiveAttribute.raw([TextDirective(uppercaseFn)]);
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = TextDirectiveAttribute.raw([TextDirective(uppercaseFn)]);
      final attr2 = TextDirectiveAttribute.raw([TextDirective(lowercaseFn)]);
      expect(attr1, isNot(attr2));
    });

    group('UppercaseDirective', () {
      test('modify returns correct value', () {
        final attribute = uppercase();
        final modified = attribute.modify('hello');
        expect(modified, 'HELLO');
      });
    });

    group('CapitalizeDirective', () {
      test('modify returns correct value', () {
        final attribute = capitalize();
        final modified = attribute.modify('hello');
        expect(modified, 'Hello');
      });
    });

    group('LowercaseDirective', () {
      test('modify returns correct value', () {
        final attribute = lowercase();
        final modified = attribute.modify('HELLO');
        expect(modified, 'hello');
      });
    });

    group('SentenceCaseDirective', () {
      test('modify returns correct value', () {
        final attribute = sentenceCase();
        final modified = attribute.modify('hello');
        expect(modified, 'Hello');
      });
    });

    group('TitleCaseDirective', () {
      test('modify returns correct value', () {
        final attribute = titleCase();
        final modified = attribute.modify('hello');
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
