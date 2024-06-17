// ignore_for_file: non_constant_identifier_names

import 'package:build/build.dart';

final _generationRegistry = {};

class GenerationRegistry {
  final Set<DeclarationReference> _generatedFunctions = {};

  final AssetId assetId;

  GenerationRegistry(this.assetId);

  static GenerationRegistry get(AssetId assetId) {
    return _generationRegistry[assetId] ??= GenerationRegistry(assetId);
  }

  bool isDeclarationGenerated(DeclarationReference declaration) {
    return _generatedFunctions.contains(declaration);
  }

  void addDeclaration(DeclarationReference declaration) {
    _generatedFunctions.add(declaration);
  }
}

class DeclarationReference {
  final String _name;
  final String code;
  final List<DeclarationReference> needs;

  DeclarationReference({
    required String name,
    required String code,
    this.needs = const [],
  })  : code = code,
        _name = name;

  String get ref => '_\$${_name}';

  String toString() => ref;

  String get method => code.replaceAll('{{name}}', ref);

  String apply(DeclarationProvider context) {
    final methods = <String>[];

    if (context.shouldApplyReference(this)) {
      methods.add(method);
    }

    for (final need in needs) {
      methods.add(need.apply(context));
    }

    return methods.join('\n');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeclarationReference &&
        other._name == _name &&
        other.code == code;
  }

  @override
  int get hashCode => _name.hashCode ^ code.hashCode;
}

class DeclarationProvider {
  final Set<DeclarationReference> _usedReferences = {};
  final Set<DeclarationReference> _appliedReferences = {};
  final GenerationRegistry registry;
  DeclarationProvider({required this.registry});

  String applyMethods() {
    final methods = <String>[];

    methods.add(_lerpDouble.apply(this));
    methods.add(_lerpStrutStyle.apply(this));
    methods.add(_lerpMatrix4.apply(this));
    methods.add(_lerpTextStyle.apply(this));
    methods.add(_merge.apply(this));

    return methods.join('\n');
  }

  bool shouldApplyReference(DeclarationReference reference) {
    if (registry.isDeclarationGenerated(reference)) {
      return false;
    }
    if (_usedReferences.contains(reference) &&
        !_appliedReferences.contains(reference)) {
      _appliedReferences.add(reference);
      registry.addDeclaration(reference);
      return true;
    } else {
      return false;
    }
  }

  DeclarationReference get merge {
    _usedReferences.add(_merge);
    return _merge;
  }

  DeclarationReference get lerpDouble {
    _usedReferences.add(_lerpDouble);
    return _lerpDouble;
  }

  DeclarationReference get lerpStrutStyle {
    _usedReferences.add(_lerpStrutStyle);
    return _lerpStrutStyle;
  }

  DeclarationReference get lerpMatrix4 {
    _usedReferences.add(_lerpMatrix4);
    return _lerpMatrix4;
  }

  DeclarationReference get lerpTextStyle {
    _usedReferences.add(_lerpTextStyle);
    return _lerpTextStyle;
  }

  static final _merge = DeclarationReference(
    name: 'merge',
    code: '''
List<T>? {{name}}<T>(List<T>? a, List<T>? b) {
  if (b == null) return a;
  if (a == null) return b;

  final mergedList = [...a];
  for (int i = 0; i < b.length; i++) {
    if (i < mergedList.length) {
      mergedList[i] = b[i] ?? mergedList[i];
    } else {
      mergedList.add(b[i]);
    }
  }

  return mergedList;
}
''',
  );

  static final _lerpDouble = DeclarationReference(
    name: 'lerpDouble',
    code: '''
double? {{name}}(num? a, num? b, double t) {
  if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
    return a?.toDouble();
  }
  a ??= 0.0;
  b ??= 0.0;
  return a * (1.0 - t) + b * t;
}
''',
  );

  static final _lerpStrutStyle = DeclarationReference(
    name: 'lerpStrutStyle',
    needs: [_lerpDouble],
    code: '''
StrutStyle? {{name}}(StrutStyle? a, StrutStyle? b, double t) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;

  return StrutStyle(
    fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
    fontFamilyFallback: t < 0.5 ? a.fontFamilyFallback : b.fontFamilyFallback,
    fontSize: $_lerpDouble(a.fontSize, b.fontSize, t),
    height: $_lerpDouble(a.height, b.height, t),
    leading: $_lerpDouble(a.leading, b.leading, t),
    fontWeight: FontWeight.lerp(a.fontWeight, b.fontWeight, t),
    fontStyle: t < 0.5 ? a.fontStyle : b.fontStyle,
    forceStrutHeight: t < 0.5 ? a.forceStrutHeight : b.forceStrutHeight,
    debugLabel: a.debugLabel ?? b.debugLabel,
    leadingDistribution: t < 0.5 ? a.leadingDistribution : b.leadingDistribution,
  );
}
''',
  );

  static final _lerpMatrix4 = DeclarationReference(
    name: 'lerpMatrix4',
    code: '''
Matrix4? {{name}}(Matrix4? a, Matrix4? b, double t) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;

  return Matrix4Tween(begin: a, end: b).lerp(t);
}
''',
  );

  static final _lerpTextStyle = DeclarationReference(
    name: 'lerpTextStyle',
    code: '''
TextStyle? {{name}}(TextStyle? a, TextStyle? b, double t) {
  return TextStyle.lerp(a, b, t)?.copyWith(shadows: Shadow.lerpList(a?.shadows, b?.shadows, t));
}
''',
  );
}
