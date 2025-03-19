/// Interface for all code builders in the mix_generator system.
abstract class CodeBuilder {
  /// Builds the code as a string
  String build();
}

/// A class builder that generates a complete class definition
class ClassBuilder implements CodeBuilder {
  /// The class name
  final String className;

  /// The class documentation
  final String? documentation;

  /// Whether the class is final
  final bool isFinal;

  /// Whether the class is base
  final bool isBase;

  /// Whether the class is sealed
  final bool isSealed;

  /// The class's superclass, if any
  final String? extendsClass;

  /// The interfaces this class implements
  final List<String> implementsInterfaces;

  /// The mixins this class uses
  final List<String> withMixins;

  /// The class's type parameters, if any
  final String? typeParameters;

  /// The constructor code
  final String constructorCode;

  /// The fields of the class
  final List<String> fields;

  /// The methods of the class
  final List<String> methods;

  const ClassBuilder({
    required this.className,
    this.documentation,
    this.isFinal = false,
    this.isBase = false,
    this.isSealed = false,
    this.extendsClass,
    this.implementsInterfaces = const [],
    this.withMixins = const [],
    this.typeParameters,
    required this.constructorCode,
    this.fields = const [],
    this.methods = const [],
  });

  @override
  String build() {
    final buffer = StringBuffer();

    // Add documentation
    if (documentation != null) {
      buffer.writeln(documentation!.trim());
    }

    // Class declaration
    if (isFinal) buffer.write('final ');
    if (isBase) buffer.write('base ');
    if (isSealed) buffer.write('sealed ');

    buffer.write('class $className');

    // Add type parameters if any
    if (typeParameters != null) {
      buffer.write(typeParameters);
    }

    // Add extends clause if any
    if (extendsClass != null) {
      buffer.write(' extends $extendsClass');
    }

    // Add implements clause if any
    if (implementsInterfaces.isNotEmpty) {
      buffer.write(' implements ${implementsInterfaces.join(', ')}');
    }

    // Add with clause if any
    if (withMixins.isNotEmpty) {
      buffer.write(' with ${withMixins.join(', ')}');
    }

    buffer.writeln(' {');

    // Add fields
    for (final field in fields) {
      buffer.writeln('  $field');
    }

    if (fields.isNotEmpty) buffer.writeln();

    // Add constructor
    buffer.writeln('  $constructorCode');
    buffer.writeln();

    // Add methods
    for (final method in methods) {
      buffer.writeln('  $method');
      buffer.writeln();
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// A mixin builder that generates a mixin definition
class MixinBuilder implements CodeBuilder {
  /// The mixin name
  final String mixinName;

  /// The mixin documentation
  final String? documentation;

  /// The classes this mixin can be applied to (on clause)
  final String onClasses;

  /// The methods of the mixin
  final List<String> methods;

  const MixinBuilder({
    required this.mixinName,
    this.documentation,
    required this.onClasses,
    this.methods = const [],
  });

  @override
  String build() {
    final buffer = StringBuffer();

    // Add documentation
    if (documentation != null) {
      buffer.writeln(documentation);
    }

    // Mixin declaration
    buffer.writeln('mixin $mixinName on $onClasses {');

    // Add methods
    for (final method in methods) {
      buffer.writeln('  $method');
      buffer.writeln();
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// An extension builder that generates an extension definition
class ExtensionBuilder implements CodeBuilder {
  /// The extension name
  final String extensionName;

  /// The extension documentation
  final String? documentation;

  /// The type this extension extends
  final String onType;

  /// The methods of the extension
  final List<String> methods;

  const ExtensionBuilder({
    required this.extensionName,
    this.documentation,
    required this.onType,
    this.methods = const [],
  });

  @override
  String build() {
    final buffer = StringBuffer();

    // Add documentation
    if (documentation != null) {
      buffer.writeln(documentation);
    }

    // Extension declaration
    buffer.writeln('extension $extensionName on $onType {');

    // Add methods
    for (final method in methods) {
      buffer.writeln('  $method');
      buffer.writeln();
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}
