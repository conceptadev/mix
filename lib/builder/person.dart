import 'spec_definition.dart';

part 'person.g.dart';

@SpecDefinition()
class Person {
  final String? name;
  final int age;

  const Person({this.name = 'car', required this.age});
}
