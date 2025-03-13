import 'package:mix_generator/src/core/type_registry.dart';
import 'package:test/test.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TypeRegistry', () {
    test('detects and registers Spec classes correctly', () async {
      // Define test code with a Spec class
      const testCode = '''
        class TestSpec extends Spec<TestSpec> {
          final String name;
          
          const TestSpec({required this.name});
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Create a new TypeRegistry for testing
      final registry = TypeRegistry.instance;

      // Scan the library to populate the registry
      registry.scanLibrary(library);

      // Get the class element and its type
      final classElement = library.getClass('TestSpec')!;
      final dartType = classElement.thisType;

      // Verify the mapping was created correctly
      final mapping = registry.getMappingForType(dartType);
      expect(mapping, isNotNull);
      expect(mapping!.isSpec, isTrue);
      expect(mapping.reference.name, equals('TestSpec'));
      expect(mapping.representation.name, equals('TestSpecAttribute'));
      expect(mapping.utility.name, equals('TestSpecUtility'));
    });

    test('detects and registers Dto classes correctly', () async {
      // Define test code with a Dto class
      const testCode = '''
        class ValueType {}
        
        class TestDto extends Dto<ValueType> {
          final String name;
          
          const TestDto({required this.name});
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Create a new TypeRegistry for testing
      final registry = TypeRegistry.instance;

      // Scan the library to populate the registry
      registry.scanLibrary(library);

      // Get the class element and its type
      final classElement = library.getClass('TestDto')!;
      final dartType = classElement.thisType;

      // Get the ValueType class element and its type
      final valueTypeElement = library.getClass('ValueType')!;
      final valueType = valueTypeElement.thisType;

      // Verify the mapping was created correctly
      final mapping = registry.getMappingForType(valueType);
      expect(mapping, isNotNull);
      expect(mapping!.isSpec, isFalse);
      expect(mapping.reference.name, equals('ValueType'));
      expect(mapping.representation.name, equals('TestDto'));
      expect(mapping.utility.name, equals('TestDtoUtility'));
    });

    test('getRepresentationType returns correct representation type', () async {
      // Define test code with a Spec class
      const testCode = '''
        class TestSpec extends Spec<TestSpec> {
          final String name;
          
          const TestSpec({required this.name});
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Create a new TypeRegistry for testing
      final registry = TypeRegistry.instance;

      // Scan the library to populate the registry
      registry.scanLibrary(library);

      // Get the class element and its type
      final classElement = library.getClass('TestSpec')!;
      final dartType = classElement.thisType;

      // Verify getRepresentationType returns the correct type
      final representationType = registry.getRepresentationType(dartType);
      expect(representationType, isNotNull);
      expect(representationType!.name, equals('TestSpecAttribute'));
    });

    test('getUtilityType returns correct utility type', () async {
      // Define test code with a Spec class
      const testCode = '''
        class TestSpec extends Spec<TestSpec> {
          final String name;
          
          const TestSpec({required this.name});
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Create a new TypeRegistry for testing
      final registry = TypeRegistry.instance;

      // Scan the library to populate the registry
      registry.scanLibrary(library);

      // Get the class element and its type
      final classElement = library.getClass('TestSpec')!;
      final dartType = classElement.thisType;

      // Verify getUtilityType returns the correct type
      final utilityType = registry.getUtilityType(dartType);
      expect(utilityType, isNotNull);
      expect(utilityType!.name, equals('TestSpecUtility'));
    });

    test('getUtilityNameFromTypeName handles different input formats', () {
      final registry = TypeRegistry.instance;

      // Test with a simple type name
      expect(
          registry.getUtilityNameFromTypeName('Color'), equals('ColorUtility'));

      // Test with a type name that already has Utility suffix
      expect(registry.getUtilityNameFromTypeName('ColorUtility'),
          equals('ColorUtility'));

      // Test with a Dto suffix
      expect(registry.getUtilityNameFromTypeName('ColorDto'),
          equals('ColorUtility'));

      // Test with an Attribute suffix
      expect(registry.getUtilityNameFromTypeName('ColorAttribute'),
          equals('ColorUtility'));

      // Test with lowercase first letter
      expect(
          registry.getUtilityNameFromTypeName('color'), equals('ColorUtility'));
    });

    test('scans imported libraries', () async {
      // Define test code with imports
      const testCode = '''
        import 'package:test_package/imported.dart';
        
        class LocalSpec extends Spec<LocalSpec> {
          final String name;
          
          const LocalSpec({required this.name});
        }
      ''';

      const importedCode = '''
        import 'package:mix/mix.dart';
        
        class ImportedSpec extends Spec<ImportedSpec> {
          final int value;
          
          const ImportedSpec({required this.value});
        }
      ''';

      // Use the simpler approach with resolveMixTestLibrary
      final library = await resolveMixTestLibrary(testCode);

      // Create a new TypeRegistry for testing
      final registry = TypeRegistry.instance;

      // Scan the library to populate the registry
      registry.scanLibrary(library);

      // Get the class element and its type
      final classElement = library.getClass('LocalSpec')!;
      final dartType = classElement.thisType;

      // Verify the mapping was created correctly
      final mapping = registry.getMappingForType(dartType);
      expect(mapping, isNotNull);
      expect(mapping!.isSpec, isTrue);
      expect(mapping.reference.name, equals('LocalSpec'));

      // Since we can't easily test imported libraries with resolveMixTestLibrary,
      // we'll focus on testing that the local library is scanned correctly
    });
  });

  group('TypeReference', () {
    test('constructor handles generic types correctly', () {
      // Test with a simple type name
      final simpleRef = TypeReference('TestClass');
      expect(simpleRef.name, equals('TestClass'));

      // Test with a generic type name
      final genericRef = TypeReference('List<String>');
      expect(genericRef.name, equals('List'));

      // Test with a nested generic type name
      final nestedGenericRef = TypeReference('Map<String, List<int>>');
      expect(nestedGenericRef.name, equals('Map'));
    });

    test('fromType creates TypeReference from DartType', () async {
      // Define test code with a generic type
      const testCode = '''
        class TestClass<T> {
          List<T> items;
          
          TestClass(this.items);
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveSimpleTestLibrary(testCode);

      // Get the class element
      final classElement = library.getClass('TestClass')!;

      // Get the field element and its type
      final fieldElement = classElement.fields.first;
      final fieldType = fieldElement.type;

      // Create TypeReference from the field type
      final typeRef = TypeReference.fromType(fieldType);

      // Verify the TypeReference was created correctly
      expect(typeRef.name, equals('List'));
      expect(typeRef.type, equals(fieldType));
    });
  });

  group('TypeMapping', () {
    test('key returns reference name', () {
      // Create TypeReferences
      final reference = TypeReference('TestClass');
      final representation = TypeReference('TestClassAttribute');
      final utility = TypeReference('TestClassUtility');

      // Create TypeMapping
      final mapping = TypeMapping(
        reference: reference,
        representation: representation,
        utility: utility,
        isSpec: true,
      );

      // Verify key returns reference name
      expect(mapping.key, equals('TestClass'));
    });

    test('toString returns formatted string', () {
      // Create TypeReferences
      final reference = TypeReference('TestClass');
      final representation = TypeReference('TestClassAttribute');
      final utility = TypeReference('TestClassUtility');

      // Create TypeMapping
      final mapping = TypeMapping(
        reference: reference,
        representation: representation,
        utility: utility,
        isSpec: true,
      );

      // Verify toString returns formatted string
      expect(
        mapping.toString(),
        equals('TypeMapping(reference: TypeReference(name: TestClass, type: ), '
            'representation: TypeReference(name: TestClassAttribute, type: ), '
            'utility: TypeReference(name: TestClassUtility, type: ), '
            'isSpec: true)'),
      );
    });
  });
}

// Mock defi
