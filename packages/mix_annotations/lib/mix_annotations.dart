library mix_annotations;

class MixSpec {
  final String? name;

  const MixSpec({this.name});
}

class MixProperty {
  final Type? dtoType;
  final String? dtoName;

  const MixProperty({this.dtoType, this.dtoName});
}
