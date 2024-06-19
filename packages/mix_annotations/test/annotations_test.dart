import 'package:mix_annotations/mix_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('MixableSpec', () {
    group('MixableDto', () {
      test('should create instance with default values', () {
        final dto = MixableDto();
        expect(dto.mergeLists, isTrue);
        expect(dto.generateValueExtension, isTrue);
        expect(dto.generateUtility, isTrue);
      });

      test('should create instance with provided values', () {
        final dto = MixableDto(
            mergeLists: false,
            generateValueExtension: false,
            generateUtility: false);
        expect(dto.mergeLists, isFalse);
        expect(dto.generateValueExtension, isFalse);
        expect(dto.generateUtility, isFalse);
      });
    });

    group('MixableProperty', () {
      test('should create instance with default values', () {
        final property = MixableProperty();
        expect(property.dto, isNull);
        expect(property.utilities, isNull);
      });

      test('should create instance with provided values', () {
        final dto = MixableFieldDto(type: String);
        final utilities = [MixableUtility(alias: 'util', type: int)];
        final property = MixableProperty(dto: dto, utilities: utilities);
        expect(property.dto, equals(dto));
        expect(property.utilities, equals(utilities));
      });
    });

    group('MixableFieldDto', () {
      test('should create instance with default values', () {
        final dto = MixableFieldDto();
        expect(dto.type, isNull);
      });

      test('should create instance with provided values', () {
        final dto = MixableFieldDto(type: int);
        expect(dto.type, equals(int));
      });

      test('typeAsString should return string representation of type', () {
        final dto1 = MixableFieldDto(type: 'String');
        expect(dto1.typeAsString, equals('String'));

        final dto2 = MixableFieldDto(type: int);
        expect(dto2.typeAsString, equals('int'));
      });
    });

    group('MixableUtility', () {
      test('should create instance with default values', () {
        final utility = MixableUtility();
        expect(utility.alias, isNull);
        expect(utility.type, isNull);
        expect(utility.properties, isEmpty);
      });

      test('should create instance with provided values', () {
        final properties = [(path: 'path', alias: 'alias')];
        final utility =
            MixableUtility(alias: 'util', type: int, properties: properties);
        expect(utility.alias, equals('util'));
        expect(utility.type, equals(int));
        expect(utility.properties, equals(properties));
      });

      test('typeAsString should return string representation of type', () {
        final utility1 = MixableUtility(type: 'String');
        expect(utility1.typeAsString, equals('String'));

        final utility2 = MixableUtility(type: int);
        expect(utility2.typeAsString, equals('int'));
      });
    });
  });
}
