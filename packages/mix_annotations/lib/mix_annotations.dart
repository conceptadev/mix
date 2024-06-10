library mix_annotations;

class Mixable {
  const Mixable();
}

class MixableSpec {
  final String? utilityName;
  final String? attributeName;

  const MixableSpec({
    this.utilityName,
    this.attributeName,
  });
}

class MixableField {
  final MixableDto? dto;
  final MixableFieldUtility? utility;

  const MixableField({
    this.dto,
    this.utility,
  });
}

class MixableDto {
  final Object? type;
  final String? alias;

  const MixableDto({
    this.type,
    this.alias,
  });

  String get typeAsString {
    return type is String ? type as String : type.toString();
  }
}

class MixableFieldUtility {
  final String? alias;
  final Object? type;
  final List<MixableFieldProperty>? properties;
  final List<MixableFieldUtility>? extraUtilities;

  const MixableFieldUtility({
    this.alias,
    this.type,
    this.properties,
    this.extraUtilities,
  });

  String? get typeAsString {
    return type is String ? type as String : type?.toString();
  }
}

class MixableFieldProperty {
  final String? alias;
  final String property;
  final List<MixableFieldProperty>? properties;
  const MixableFieldProperty(
    this.property, {
    this.alias,
    this.properties,
  });
}
