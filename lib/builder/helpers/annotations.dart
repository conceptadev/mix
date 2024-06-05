class MixSpec {
  final String? name;

  const MixSpec({this.name});
}

class MixProperty {
  final Type? dtoType;

  /// Description is added as a comment to the generated code.
  final String? description;
  const MixProperty({this.description, this.dtoType});
}
