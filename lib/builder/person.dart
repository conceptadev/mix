import 'spec_definition.dart';

part 'person.spec.g.dart';

@SpecDefinition()
class PersonDef {
  final String? name;

  final int age;

  final Map<String, String> address;

  final bool isEmployed;

  final double height;

  final Set<String> hobbies;

  final List<String> favoriteColors;

  const PersonDef({
    required this.name,
    required this.age,
    required this.address,
    required this.isEmployed,
    required this.height,
    required this.hobbies,
    required this.favoriteColors,
  });
}
