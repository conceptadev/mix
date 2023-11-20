import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('TextDirectiveAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = TextDirectiveAttribute([UppercaseDirective()]);
      const attr2 = TextDirectiveAttribute([CapitalizeDirective()]);
      final merged = attr1.merge(attr2);
      expect(merged.directives,
          [const UppercaseDirective(), const CapitalizeDirective()]);
    });
    test('resolve returns correct TextDirective with default values', () {
      const attr = TextDirectiveAttribute([]);
      final directive = attr.resolve(EmptyMixData);
      expect(directive, []);
    });
    test('resolve returns correct TextDirective with specific values', () {
      const attr =
          TextDirectiveAttribute([UppercaseDirective(), CapitalizeDirective()]);
      final directive = attr.resolve(EmptyMixData);
      expect(
          directive, [const UppercaseDirective(), const CapitalizeDirective()]);
    });
    test('Equality holds when all properties are the same', () {
      const attr1 = TextDirectiveAttribute([UppercaseDirective()]);
      const attr2 = TextDirectiveAttribute([UppercaseDirective()]);
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      const attr1 = TextDirectiveAttribute([UppercaseDirective()]);
      const attr2 = TextDirectiveAttribute([CapitalizeDirective()]);
      expect(attr1, isNot(attr2));
    });

    group('UppercaseDirective', () {
      test('modify returns correct value', () {
        const directive = UppercaseDirective();
        final modified = directive.modify('hello');
        expect(modified, 'HELLO');
      });
    });

    group('CapitalizeDirective', () {
      test('modify returns correct value', () {
        const directive = CapitalizeDirective();
        final modified = directive.modify('hello');
        expect(modified, 'Hello');
      });
    });

    group('LowercaseDirective', () {
      test('modify returns correct value', () {
        const directive = LowercaseDirective();
        final modified = directive.modify('HELLO');
        expect(modified, 'hello');
      });
    });

    group('SentenceCaseDirective', () {
      test('modify returns correct value', () {
        const directive = SentenceCaseDirective();
        final modified = directive.modify('hello');
        expect(modified, 'Hello');
      });
    });

    group('TitleCaseDirective', () {
      test('modify returns correct value', () {
        const directive = TitleCaseDirective();
        final modified = directive.modify('hello');
        expect(modified, 'Hello');
      });
    });

    group('TextDirective', () {
      test('Equality holds when all properties are the same', () {
        const attr1 = TextDirectiveAttribute([UppercaseDirective()]);
        const attr2 = TextDirectiveAttribute([UppercaseDirective()]);
        expect(attr1, attr2);
      });
      test('Equality fails when properties are different', () {
        const attr1 = TextDirectiveAttribute([UppercaseDirective()]);
        const attr2 = TextDirectiveAttribute([CapitalizeDirective()]);
        expect(attr1, isNot(attr2));
      });
    });
  });
}
