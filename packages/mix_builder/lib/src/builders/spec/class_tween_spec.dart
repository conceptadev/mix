import 'package:mix_builder/src/helpers/builder_utils.dart';

String specTweenClass(SpecAnnotationContext context) {
  final className = context.name;

  return '''
/// A tween that interpolates between two [$className] instances.
/// 
/// This class can be used in animations to smoothly transition between
/// different [$className] specifications.
class ${className}Tween extends Tween<$className?> {
  ${className}Tween({
    super.begin, super.end,
  });

  @override
  $className lerp(double t) {
    if (begin == null && end == null) return $className();
    if (begin == null) return end!;
    
    return begin!.lerp(end!, t);
  }
}
''';
}
