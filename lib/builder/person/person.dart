import '../../src/attributes/animated/animated_data.dart';
import '../spec_definition.dart';

@SpecDefinition(name: 'Person')
class PersonDef extends SpecDef {
  final String? name;

  final int? age;

  final Map<String, String>? address;

  final bool? isEmployed;

  final double? height;

  /// Hobbies of a person
  final Set<String>? hobbies;

  final List<String>? favoriteColors;

  @override
  final AnimatedData? animated;

  const PersonDef({
    this.name,
    this.age,
    this.address,
    this.isEmployed,
    this.height,
    this.hobbies,
    this.favoriteColors,
    this.animated,
  });
}

abstract class SpecDef {
  AnimatedData? get animated;
  const SpecDef();
}
