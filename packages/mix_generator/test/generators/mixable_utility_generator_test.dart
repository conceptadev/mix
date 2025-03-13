import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_generator/src/generators/mixable_utility_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

import '../src/helpers/test_helpers.dart';

void main() {
  group('MixableUtilityGenerator', () {
    test('generates utility mixin for enum type', () async {
      final library = await resolveMixTestLibrary('''
        enum Color {
          red,
          green,
          blue,
        }
        
        @MixableFieldUtility()
        class ColorUtility extends MixUtility<Attribute, Color> {
          const ColorUtility(super.builder);
        }
      ''');

      // Verify that the library resolves correctly
      expect(library, isNotNull);

      final enumElement =
          library.topLevelElements.whereType<EnumElement>().firstWhere(
                (element) => element.name == 'Color',
                orElse: () => throw Exception('Enum Color not found'),
              );
      expect(enumElement, isNotNull);

      final utilityElement = library.getClass('ColorUtility');
      expect(utilityElement, isNotNull);

      // Run the generator
      final generator = MixableUtilityGenerator();
      final buildStep = MockBuildStep();

      // Wrap the LibraryElement in a LibraryReader
      final libraryReader = LibraryReader(library);
      final output = await generator.generate(libraryReader, buildStep);

      // Verify the output contains expected content
      expect(output, contains('mixin _\$ColorUtilityMixin'));
      expect(output, contains('Attribute red()'));
      expect(output, contains('Attribute green()'));
      expect(output, contains('Attribute blue()'));
    });

    test('generates utility mixin for class type with constants', () async {
      final library = await resolveMixTestLibrary('''
        class Color {
          final int value;
          
          const Color(this.value);
          
          static const Color red = Color(0xFFFF0000);
          static const Color green = Color(0xFF00FF00);
          static const Color blue = Color(0xFF0000FF);
        }
        
        @MixableFieldUtility()
        class ColorUtility extends MixUtility<Attribute, Color> {
          const ColorUtility(super.builder);
        }
      ''');

      // Verify that the library resolves correctly
      expect(library, isNotNull);

      final classElement = library.getClass('Color');
      expect(classElement, isNotNull);

      final utilityElement = library.getClass('ColorUtility');
      expect(utilityElement, isNotNull);

      // Run the generator
      final generator = MixableUtilityGenerator();
      final buildStep = MockBuildStep();

      // Wrap the LibraryElement in a LibraryReader
      final libraryReader = LibraryReader(library);
      final output = await generator.generate(libraryReader, buildStep);

      // Verify the output contains expected content
      expect(output, contains('mixin _\$ColorUtilityMixin'));
      expect(output, contains('Attribute red()'));
      expect(output, contains('Attribute green()'));
      expect(output, contains('Attribute blue()'));
    });

    test('generates utility mixin for class type with mapping', () async {
      final library = await resolveMixTestLibrary('''
        class Color {
          final int value;
          
          const Color(this.value);
        }
        
        class Colors {
          static const Color red = Color(0xFFFF0000);
          static const Color green = Color(0xFF00FF00);
          static const Color blue = Color(0xFF0000FF);
        }
        
        @MixableFieldUtility(type: Colors)
        class ColorUtility extends MixUtility<Attribute, Color> {
          const ColorUtility(super.builder);
        }
      ''');

      // Verify that the library resolves correctly
      expect(library, isNotNull);

      final colorElement = library.getClass('Color');
      expect(colorElement, isNotNull);

      final colorsElement = library.getClass('Colors');
      expect(colorsElement, isNotNull);

      final utilityElement = library.getClass('ColorUtility');
      expect(utilityElement, isNotNull);

      // Run the generator
      final generator = MixableUtilityGenerator();
      final buildStep = MockBuildStep();

      // Wrap the LibraryElement in a LibraryReader
      final libraryReader = LibraryReader(library);
      final output = await generator.generate(libraryReader, buildStep);

      // Verify the output contains expected content
      expect(output, contains('mixin _\$ColorUtilityMixin'));
      expect(output, contains('Attribute red()'));
      expect(output, contains('Attribute green()'));
      expect(output, contains('Attribute blue()'));
    });
  });
}

/// Mock BuildStep for testing
class MockBuildStep implements BuildStep {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
