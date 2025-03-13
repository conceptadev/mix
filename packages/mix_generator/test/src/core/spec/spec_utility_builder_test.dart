import 'package:mix_generator/src/core/models/field_metadata.dart';
import 'package:mix_generator/src/core/models/spec_metadata.dart';
import 'package:mix_generator/src/core/spec/spec_utility_builder.dart';
import 'package:mix_generator/src/core/type_registry.dart';
import 'package:test/test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('SpecUtilityBuilder', () {
    test('builds basic spec utility class correctly', () async {
      // Define test code for a simple spec
      const testCode = '''
        class TestSpec extends Spec<TestSpec> {
          final String name;
          final int age;
          
          const TestSpec({required this.name, required this.age});
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Get the class element for our test spec
      final classElement = library.getClass('TestSpec')!;

      // Extract fields from the class element
      final fields = FieldMetadata.extractFromClass(classElement);

      // Create spec metadata
      final metadata = SpecMetadata(
        element: classElement,
        name: 'TestSpec',
        fields: fields,
        isConst: true,
        isDiagnosticable: false,
        constructor: classElement.unnamedConstructor!,
        isAbstract: false,
        withCopyWith: true,
        withEquality: true,
        withLerp: true,
        skipUtility: false,
        prefix: '',
        isWidgetModifier: false,
      );

      // Create a mock TypeRegistry for testing
      final mockTypeRegistry = _MockTypeRegistry();

      // Create the builder and generate the code
      final builder =
          SpecUtilityBuilder(metadata, typeRegistry: mockTypeRegistry);
      final generatedCode = builder.build();

      // Define the expected code pattern
      const expectedCode = '''
/// Utility class for configuring [TestSpec] properties.
///
/// This class provides methods to set individual properties of a [TestSpec].
/// Use the methods of this class to configure specific properties of a [TestSpec].
class TestSpecUtility<T extends Attribute> extends SpecUtility<T, TestSpecAttribute> {
  /// Utility for defining [TestSpecAttribute.name]
  late final name = StringUtility((v) => only(name: v));

  /// Utility for defining [TestSpecAttribute.age]
  late final age = IntUtility((v) => only(age: v));

  TestSpecUtility(super.builder, {super.mutable});

  TestSpecUtility<T> get chain => TestSpecUtility(attributeBuilder, mutable: true);

  static TestSpecUtility<TestSpecAttribute> get self => TestSpecUtility((v) => v);

  /// Returns a new [TestSpecAttribute] with the specified properties.
  @override
  T only({String? name, int? age,}) {
    return builder(TestSpecAttribute(
      name: name,
      age: age,
    ));
  }
}''';

      // Normalize whitespace for comparison
      final normalizedGenerated = _normalizeWhitespace(generatedCode);
      final normalizedExpected = _normalizeWhitespace(expectedCode);

      expect(normalizedGenerated, normalizedExpected);
    });

    test('builds spec utility with custom utilities correctly', () async {
      // Define test code for a spec with custom utilities
      const testCode = '''
        class CustomUtilSpec extends Spec<CustomUtilSpec> {
          @MixableField(utilities: [
            MixableFieldUtility(alias: 'customColor', type: 'ColorUtility'),
            MixableFieldUtility(alias: 'padding', properties: [
              {'path': 'all', 'alias': 'allPadding'},
              {'path': 'horizontal', 'alias': 'horizontalPadding'},
            ]),
          ])
          final dynamic style;
          
          const CustomUtilSpec({this.style});
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Get the class element for our test spec
      final classElement = library.getClass('CustomUtilSpec')!;

      // Extract fields from the class element
      final fields = FieldMetadata.extractFromClass(classElement);

      // Create spec metadata
      final metadata = SpecMetadata(
        element: classElement,
        name: 'CustomUtilSpec',
        fields: fields,
        isConst: true,
        isDiagnosticable: false,
        constructor: classElement.unnamedConstructor!,
        isAbstract: false,
        withCopyWith: true,
        withEquality: true,
        withLerp: true,
        skipUtility: false,
        prefix: '',
        isWidgetModifier: false,
      );

      // Create a mock TypeRegistry for testing
      final mockTypeRegistry = _MockTypeRegistry();

      // Create the builder and generate the code
      final builder =
          SpecUtilityBuilder(metadata, typeRegistry: mockTypeRegistry);
      final generatedCode = builder.build();

      // Define the expected code pattern
      const expectedCode = '''
/// Utility class for configuring [CustomUtilSpec] properties.
///
/// This class provides methods to set individual properties of a [CustomUtilSpec].
/// Use the methods of this class to configure specific properties of a [CustomUtilSpec].
class CustomUtilSpecUtility<T extends Attribute> extends SpecUtility<T, CustomUtilSpecAttribute> {
  /// Utility for defining [CustomUtilSpecAttribute.style]
  late final style = DynamicUtility((v) => only(style: v));

  CustomUtilSpecUtility(super.builder, {super.mutable});

  CustomUtilSpecUtility<T> get chain => CustomUtilSpecUtility(attributeBuilder, mutable: true);

  static CustomUtilSpecUtility<CustomUtilSpecAttribute> get self => CustomUtilSpecUtility((v) => v);

  /// Returns a new [CustomUtilSpecAttribute] with the specified properties.
  @override
  T only({dynamic? style,}) {
    return builder(CustomUtilSpecAttribute(
      style: style,
    ));
  }
}''';

      // Normalize whitespace for comparison
      final normalizedGenerated = _normalizeWhitespace(generatedCode);
      final normalizedExpected = _normalizeWhitespace(expectedCode);

      expect(normalizedGenerated, normalizedExpected);
    });

    test('builds widget modifier spec utility correctly', () async {
      // Define test code for a widget modifier spec
      const testCode = '''
        class TestWidgetModifierSpec extends WidgetModifierSpec<TestWidgetModifierSpec> {
          final Color? color;
          final double? opacity;
          
          const TestWidgetModifierSpec({this.color, this.opacity, super.animated});
          
          @override
          TestWidgetModifierSpec copyWith() {
            return TestWidgetModifierSpec(
              color: color,
              opacity: opacity,
              animated: animated,
            );
          }
          
          @override
          TestWidgetModifierSpec lerp(TestWidgetModifierSpec? other, double t) {
            return TestWidgetModifierSpec(
              color: Color.lerp(color, other?.color, t),
              opacity: lerpDouble(opacity, other?.opacity, t),
              animated: animated,
            );
          }
          
          @override
          Widget build(Widget child) {
            return child;
          }
        }
      ''';

      // Resolve the library with our test code
      final library = await resolveMixTestLibrary(testCode);

      // Get the class element for our test spec
      final classElement = library.getClass('TestWidgetModifierSpec')!;

      // Extract fields from the class element
      final fields = FieldMetadata.extractFromClass(classElement);

      // Create spec metadata
      final metadata = SpecMetadata(
        element: classElement,
        name: 'TestWidgetModifierSpec',
        fields: fields,
        isConst: true,
        isDiagnosticable: false,
        constructor: classElement.unnamedConstructor!,
        isAbstract: false,
        withCopyWith: true,
        withEquality: true,
        withLerp: true,
        skipUtility: false,
        prefix: '',
        isWidgetModifier: true,
      );

      // Create a mock TypeRegistry for testing
      final mockTypeRegistry = _MockTypeRegistry();

      // Create the builder and generate the code
      final builder =
          SpecUtilityBuilder(metadata, typeRegistry: mockTypeRegistry);
      final generatedCode = builder.build();

      // Define the expected code pattern
      const expectedCode = '''
/// Utility class for configuring [TestWidgetModifierSpec] properties.
///
/// This class provides methods to set individual properties of a [TestWidgetModifierSpec].
/// Use the methods of this class to configure specific properties of a [TestWidgetModifierSpec].
class TestWidgetModifierSpecUtility<T extends Attribute> extends SpecUtility<T, TestWidgetModifierSpecAttribute> {
  /// Utility for defining [TestWidgetModifierSpecAttribute.color]
  late final color = DynamicUtility((v) => only(color: v));

  /// Utility for defining [TestWidgetModifierSpecAttribute.opacity]
  late final opacity = DoubleUtility((v) => only(opacity: v));

  /// Utility for defining [TestWidgetModifierSpecAttribute.animated]
  late final animated = DynamicUtility((v) => only(animated: v));

  TestWidgetModifierSpecUtility(super.builder, {super.mutable});

  TestWidgetModifierSpecUtility<T> get chain => TestWidgetModifierSpecUtility(attributeBuilder, mutable: true);

  static TestWidgetModifierSpecUtility<TestWidgetModifierSpecAttribute> get self => TestWidgetModifierSpecUtility((v) => v);

  /// Returns a new [TestWidgetModifierSpecAttribute] with the specified properties.
  @override
  T only({InvalidType? color, double? opacity, dynamic? animated,}) {
    return builder(TestWidgetModifierSpecAttribute(
      color: color,
      opacity: opacity,
      animated: animated,
    ));
  }
}''';

      // Normalize whitespace for comparison
      final normalizedGenerated = _normalizeWhitespace(generatedCode);
      final normalizedExpected = _normalizeWhitespace(expectedCode);

      expect(normalizedGenerated, normalizedExpected);
    });
  });
}

/// A mock TypeRegistry for testing
class _MockTypeRegistry implements TypeRegistry {
  // Implement the necessary methods for testing
  @override
  TypeReference? getUtilityType(dynamic type) {
    if (type.toString().contains('String')) {
      return TypeReference('StringUtility');
    } else if (type.toString().contains('int')) {
      return TypeReference('IntUtility');
    } else if (type.toString().contains('double')) {
      return TypeReference('DoubleUtility');
    } else if (type.toString().contains('Color')) {
      return TypeReference('ColorUtility');
    } else {
      return TypeReference('DynamicUtility');
    }
  }

  @override
  String getUtilityNameFromTypeName(String typeName) {
    if (typeName == 'ColorUtility') {
      return 'ColorUtility';
    }
    return 'DynamicUtility';
  }

  // Implement other required methods with minimal functionality
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Normalizes whitespace in a string to make comparison more reliable
String _normalizeWhitespace(String input) {
  // Replace all whitespace sequences with a single space
  return input.replaceAll(RegExp(r'\s+'), ' ').trim();
}
