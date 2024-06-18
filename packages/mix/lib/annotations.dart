library mix_annotations;

class Mixable {
  const Mixable();
}

class MixableSpec {
  final String? utilityName;
  final String? attributeName;

  const MixableSpec({this.utilityName, this.attributeName});
}

class MixableDto {
  /// If true it will merge the items in the list in its position
  /// if false list items will just be added to the list
  final bool mergeLists;

  /// Skips creation of ValueExt on Ext
  final bool generateValueExtension;

  /// Skips generation of DtoUtility
  final bool generateUtility;

  const MixableDto({
    this.mergeLists = true,
    this.generateValueExtension = true,
    this.generateUtility = true,
  });
}

class MixableProperty {
  final MixableFieldDto? dto;
  final List<MixableUtility>? utilities;

  const MixableProperty({this.dto, this.utilities});
}

class MixableFieldDto {
  final Object? type;

  const MixableFieldDto({this.type});

  String? get typeAsString {
    return type is String ? type as String : type?.toString();
  }
}

typedef MixableUtilityProps = ({String path, String alias});

class MixableUtility {
  final String? alias;
  final Object? type;

  final List<MixableUtilityProps> properties;

  const MixableUtility({this.alias, this.type, this.properties = const []});

  String? get typeAsString {
    return type is String ? type as String : type?.toString();
  }
}
