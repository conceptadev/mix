import 'custom_annotation.dart';

part 'person.g.dart';

@CustomAnnotation()
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});
}
