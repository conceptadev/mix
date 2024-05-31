import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

class CustomAnnotation {
  const CustomAnnotation();
}

class CustomBuilder extends Generator {
  const CustomBuilder();
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final buffer = StringBuffer();

    for (final classElement in library.classes) {
      if (classElement.metadata.any(
        (metadata) =>
            metadata.element?.enclosingElement?.name == 'CustomAnnotation',
      )) {
        final className = classElement.name;
        final fields = classElement.fields;

        final classBuilder = Class((b) {
          b.name = className;
          b.constructors.add(Constructor((c) {
            c.constant = true;
            c.optionalParameters.addAll(
              fields.map((field) => Parameter((p) {
                    p.name = field.name;
                    p.named = true;
                    p.required = true;
                    p.type = refer(
                      field.type.getDisplayString(withNullability: false),
                    );
                  })),
            );
          }));

          // Generate copyWith method
          b.methods.add(Method((m) {
            m.name = 'copyWith';
            m.returns = refer(className);
            m.optionalParameters.addAll(
              fields.map((field) => Parameter((p) {
                    p.name = field.name;
                    p.named = true;
                    p.type = refer(
                      field.type.getDisplayString(withNullability: true),
                    );
                  })),
            );
            m.body = Block((b) {
              b.statements.add(Code("return $className("));
              b.statements.addAll(
                fields.map((field) => Code(
                      "${field.name}: ${field.name} ?? this.${field.name},",
                    )),
              );
              b.statements.add(const Code(");"));
            });
          }));

          // Generate toMap method
          b.methods.add(Method((m) {
            m.name = 'toMap';
            m.returns = refer('Map<String, dynamic>');
            m.body = Block((b) {
              b.statements.add(const Code("return {"));
              b.statements.addAll(
                fields.map((field) => Code("'${field.name}': ${field.name},")),
              );
              b.statements.add(const Code("};"));
            });
          }));

          // Generate toString method
          b.methods.add(Method((m) {
            m.name = 'toString';
            m.annotations.add(refer('override'));
            m.returns = refer('String');
            m.lambda = true;
            m.body = Code(
              "'$className(${fields.map((field) => '${field.name}: \$${field.name}').join(', ')})'",
            );
          }));

          // Generate equality operator (==)
          b.methods.add(Method((m) {
            m.name = 'operator ==';
            m.annotations.add(refer('override'));
            m.returns = refer('bool');
            m.requiredParameters.add(Parameter((p) {
              p.name = 'other';
              p.type = refer('Object');
            }));
            m.body = Block((b) {
              b.statements
                  .add(const Code("if (identical(this, other)) return true;"));
              b.statements.add(Code("return other is $className"));
              b.statements.addAll(
                fields.map(
                  (field) => Code("&& other.${field.name} == ${field.name}"),
                ),
              );
              b.statements.add(const Code(";"));
            });
          }));

          // Generate hashCode getter
          b.methods.add(Method((m) {
            m.name = 'hashCode';
            m.annotations.add(refer('override'));
            m.type = MethodType.getter;
            m.returns = refer('int');
            m.body = Code(
              "return ${fields.map((field) => '${field.name}.hashCode').join(' ^ ')};",
            );
          }));
        });

        buffer.writeln(classBuilder.accept(DartEmitter()).toString());
      }
    }

    final generatedCode = buffer.toString();
    final outputFile = buildStep.inputId.changeExtension('.g.dart');
    await buildStep.writeAsString(outputFile, generatedCode);

    return generatedCode;
  }
}
