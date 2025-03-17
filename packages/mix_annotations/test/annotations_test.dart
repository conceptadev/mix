import 'package:mix_annotations/mix_annotations.dart';
import 'package:test/test.dart';

void main() {
  group('MixableSpec', () {
    group('MixableResolvable', () {
      test('should create instance with default values', () {
        const dto = MixableResolvable();
        expect(dto.components, equals(GeneratedResolvableComponents.all));
      });

      test('should create instance with provided values', () {
        const dto =
            MixableResolvable(components: GeneratedResolvableComponents.none);
        expect(dto.components, equals(GeneratedResolvableComponents.none));
      });
    });

    group('MixableField', () {
      test('should create instance with default values', () {
        const property = MixableField();
        expect(property.dto, isNull);
        expect(property.utilities, isNull);
      });

      test('should create instance with provided values', () {
        const dto = MixableFieldResolvable(type: String);
        final utilities = [const MixableFieldUtility(alias: 'util', type: int)];
        final property = MixableField(dto: dto, utilities: utilities);
        expect(property.dto, equals(dto));
        expect(property.utilities, equals(utilities));
      });
    });

    group('MixableFieldDto', () {
      test('should create instance with default values', () {
        const dto = MixableFieldResolvable();
        expect(dto.type, isNull);
      });

      test('should create instance with provided values', () {
        const dto = MixableFieldResolvable(type: int);
        expect(dto.type, equals(int));
      });
    });

    group('MixableUtility', () {
      test('should create instance with default values', () {
        const utility = MixableFieldUtility();
        expect(utility.alias, isNull);
        expect(utility.type, isNull);
        expect(utility.properties, isEmpty);
      });

      test('should create instance with provided values', () {
        final properties = [(path: 'path', alias: 'alias')];
        final utility = MixableFieldUtility(
            alias: 'util', type: int, properties: properties);
        expect(utility.alias, equals('util'));
        expect(utility.type, equals(int));
        expect(utility.properties, equals(properties));
      });

      test('typeAsString should return string representation of type', () {
        const utility1 = MixableFieldUtility(type: 'String');
        expect(utility1.typeAsString, equals('String'));

        const utility2 = MixableFieldUtility(type: int);
        expect(utility2.typeAsString, equals('int'));
      });
    });
  });
}
