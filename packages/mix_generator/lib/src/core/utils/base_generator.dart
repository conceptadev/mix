import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

/// Base class for all mix generators.
///
/// This class handles common functionality like type scanning, error handling,
/// and formatting across all generators.
abstract class BaseMixGenerator<T, M> extends Generator {
  final TypeChecker typeChecker;
  final Logger _logger = Logger('BaseMixGenerator');
  final DartFormatter _formatter = DartFormatter(
    languageVersion: DartFormatter.latestShortStyleLanguageVersion,
    pageWidth: 80,
  );

  /// Creates a base mix generator with the given type checker
  BaseMixGenerator(this.typeChecker);

  /// Whether this generator allows abstract classes
  bool get allowAbstractClasses => false;

  /// The name of the annotation for error messages
  String get annotationName => typeChecker.toString();

  /// Creates metadata from a class element
  Future<M> createMetadata(ClassElement element, BuildStep buildStep);

  /// Generates code for a metadata instance
  String generateForMetadata(M metadata, BuildStep buildStep);

  /// Formats the generated code
  String format(String code) {
    try {
      return _formatter.format(code);
    } catch (e) {
      _logger.warning('Error formatting code: $e');

      return code; // Return unformatted code if formatting fails
    }
  }

  /// Validates a class element
  void validateClassElement(ClassElement element) {
    if (element.isAbstract && !allowAbstractClasses) {
      throw InvalidGenerationSourceError(
        'The @$annotationName annotation cannot be applied to abstract classes.',
        element: element,
      );
    }
  }

  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    // Find annotated elements
    final elements = library
        .annotatedWith(typeChecker)
        .map((annotated) => annotated.element)
        .whereType<ClassElement>()
        .toList();

    if (elements.isEmpty) return null;

    final buffer = StringBuffer();

    for (final element in elements) {
      try {
        final metadata = await createMetadata(element, buildStep);
        final code = generateForMetadata(metadata, buildStep);

        if (code.isNotEmpty) {
          buffer.writeln(code);
        }
      } catch (e, stackTrace) {
        _logger.severe(
          'Error generating code for ${element.name}',
          e,
          stackTrace,
        );

        buffer.writeln(
          '// Error generating code for ${element.name}: ${e.toString()}',
        );
      }
    }

    if (buffer.isEmpty) return null;

    return format(buffer.toString());
  }
}
