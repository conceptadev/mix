library mix_annotations;

class MixSpec {
  final String? name;

  const MixSpec({this.name});
}

class MixProperty {
  final Type? dtoType;
  final String? dtoName;
  final Type? utilityType;
  final String? utilityName;
  final List<String>? utilityProps;

  const MixProperty({
    this.dtoType,
    this.dtoName,
    this.utilityType,
    this.utilityName,
    this.utilityProps,
  });
}
