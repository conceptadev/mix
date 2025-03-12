// test/src/core/type_registry_test.dart
import 'package:analyzer/dart/element/element.dart';
import 'package:build_test/build_test.dart';
import 'package:logging/logging.dart';
import 'package:mix_generator/src/helpers/type_registry.dart';
import 'package:test/test.dart';

void main() {
  // Enable logging for debugging
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
  });

  group('TypeRegistry', () {
    // Instance to test
    late TypeRegistry registry;

    setUp(() {
      // Create a fresh instance for each test
      registry = TypeRegistry.instance;
    });

    test('registers default mappings correctly', () {
      // Verify default primitive mappings
      expect(registry.mappings['double']?.utilityType, equals('DoubleUtility'));
      expect(registry.mappings['int']?.utilityType, equals('IntUtility'));
      expect(registry.mappings['bool']?.utilityType, equals('BoolUtility'));
      expect(registry.mappings['String']?.utilityType, equals('StringUtility'));

      // Verify common Flutter type mappings
      expect(
          registry.mappings['Color']?.representationType, equals('ColorDto'));
      expect(registry.mappings['Color']?.utilityType, equals('ColorUtility'));

      expect(registry.mappings['EdgeInsetsGeometry']?.representationType,
          equals('SpacingDto'));
      expect(registry.mappings['EdgeInsetsGeometry']?.utilityType,
          equals('SpacingUtility'));
    });

    test('registerRepresentationMapping adds or updates mappings', () {
      // Register a new mapping
      registry.registerRepresentationMapping('TestType', 'TestDto');
      expect(
          registry.mappings['TestType']?.representationType, equals('TestDto'));
      expect(registry.mappings['TestType']?.isDto, isTrue);

      // Override an existing mapping
      registry.registerRepresentationMapping('TestType', 'NewTestDto');
      expect(registry.mappings['TestType']?.representationType,
          equals('NewTestDto'));

      // Register with isDto = false
      registry.registerRepresentationMapping('SpecType', 'SpecAttribute',
          isDto: false);
      expect(registry.mappings['SpecType']?.representationType,
          equals('SpecAttribute'));
      expect(registry.mappings['SpecType']?.isDto, isFalse);
    });

    test('registerUtilityMapping adds or updates mappings', () {
      // Register a new mapping
      registry.registerUtilityMapping('TestType', 'TestUtility');
      expect(registry.mappings['TestType']?.utilityType, equals('TestUtility'));

      // Override an existing mapping
      registry.registerUtilityMapping('TestType', 'NewTestUtility');
      expect(
          registry.mappings['TestType']?.utilityType, equals('NewTestUtility'));
    });

    test('getUtilityNameFromTypeName handles different type name formats', () {
      // Basic type name
      expect(
          registry.getUtilityNameFromTypeName('Test'), equals('TestUtility'));

      // Type name with Dto suffix
      expect(registry.getUtilityNameFromTypeName('TestDto'),
          equals('TestUtility'));

      // Type name with Attribute suffix
      expect(registry.getUtilityNameFromTypeName('TestAttribute'),
          equals('TestUtility'));

      // Type name that already has Utility suffix
      expect(registry.getUtilityNameFromTypeName('TestUtility'),
          equals('TestUtility'));

      // Type name with lowercase first letter
      expect(
          registry.getUtilityNameFromTypeName('test'), equals('TestUtility'));
    });

    // Integration tests using build_test
    group('Integration with real Dart code', () {
      Future<LibraryElement> resolveLibrary(String code) async {
        final resolver = await resolveSource('''
          // @dart=2.12
          library test_lib;
          
          abstract class MixUtility<T, V> {}
          abstract class Dto<T> {}
          abstract class SpecAttribute<T> {}
          abstract class WidgetModifierSpecAttribute<T> {}
          
          $code
        ''', (resolver) async {
          return resolver.findLibraryByName('test_lib');
        });

        return resolver!;
      }

      test('scanLibrary detects utility classes', () async {
        final library = await resolveLibrary('''
          class StringUtility extends MixUtility<String, String> {}
          class IntUtility extends MixUtility<int, int> {}
          class ListUtility<T, E> extends MixUtility<List<T>, List<E>> {}
        ''');

        registry.scanLibrary(library);

        expect(
            registry.mappings['String']?.utilityType, equals('StringUtility'));
        expect(registry.mappings['int']?.utilityType, equals('IntUtility'));
      });

      test('scanLibrary detects DTO classes', () async {
        final library = await resolveLibrary('''
          class ColorDto extends Dto<Color> {}
          class SizeDto extends Dto<Size> {}
          
          class Color {}
          class Size {}
        ''');

        registry.scanLibrary(library);

        expect(
            registry.mappings['Color']?.representationType, equals('ColorDto'));
        expect(registry.mappings['Color']?.isDto, isTrue);
        expect(
            registry.mappings['Size']?.representationType, equals('SizeDto'));
        expect(registry.mappings['Size']?.isDto, isTrue);
      });

      test('scanLibrary detects Attribute classes', () async {
        final library = await resolveLibrary('''
          class ButtonSpec {}
          class CardSpec {}
          
          class ButtonAttribute extends SpecAttribute<ButtonSpec> {}
          class CardAttribute extends WidgetModifierSpecAttribute<CardSpec> {}
        ''');

        registry.scanLibrary(library);

        expect(registry.mappings['ButtonSpec']?.representationType,
            equals('ButtonAttribute'));
        expect(registry.mappings['ButtonSpec']?.isDto, isFalse);
        expect(registry.mappings['ButtonSpec']?.isSpec, isTrue);

        expect(registry.mappings['CardSpec']?.representationType,
            equals('CardAttribute'));
        expect(registry.mappings['CardSpec']?.isDto, isFalse);
        expect(registry.mappings['CardSpec']?.isSpec, isTrue);
      });

      test('getMappingForType handles List types', () async {
        final library = await resolveLibrary('''
          class StringUtility extends MixUtility<String, String> {}
          class ListUtility<T, E> extends MixUtility<List<T>, List<E>> {}
          
          class StringDto extends Dto<String> {}
          
          void example(List<String> items) {}
        ''');

        registry.scanLibrary(library);

        // Find the parameter type from the example function
        final exampleFunction = library.units.first.functions
            .firstWhere((f) => f.name == 'example');
        final listStringType = exampleFunction.parameters.first.type;

        final mapping = registry.getMappingForType(listStringType);

        expect(mapping.type, equals('List<String>'));
        expect(mapping.representationType, equals('List<StringDto>'));
        expect(mapping.utilityType, equals('ListUtility'));
      });

      test('getMappingForType handles inheritance', () async {
        final library = await resolveLibrary('''
          abstract class Shape {}
          class Circle extends Shape {}
          class Rectangle extends Shape {}
          
          class ShapeUtility extends MixUtility<Shape, Shape> {}
          class ShapeDto extends Dto<Shape> {}
          
          void example(Circle circle, Rectangle rectangle) {}
        ''');

        registry.scanLibrary(library);

        // Find the parameter types from the example function
        final exampleFunction = library.units.first.functions
            .firstWhere((f) => f.name == 'example');
        final circleType = exampleFunction.parameters[0].type;
        final rectangleType = exampleFunction.parameters[1].type;

        final circleMapping = registry.getMappingForType(circleType);
        final rectangleMapping = registry.getMappingForType(rectangleType);

        // Both should inherit from the Shape mappings
        expect(circleMapping.representationType, equals('ShapeDto'));
        expect(circleMapping.utilityType, equals('ShapeUtility'));

        expect(rectangleMapping.representationType, equals('ShapeDto'));
        expect(rectangleMapping.utilityType, equals('ShapeUtility'));
      });
    });
  });
}
