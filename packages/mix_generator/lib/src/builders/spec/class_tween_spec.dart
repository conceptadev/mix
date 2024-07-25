import 'package:mix_generator/src/helpers/field_info.dart';

String specTweenClass(ClassBuilderContext classInfo) {
  final className = classInfo.name;
  final constructorRef = classInfo.constructorRef;

  final constIndicator = classInfo.isConst ? 'const' : '';

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
    if (begin == null && end == null) {
      return $constIndicator $className$constructorRef();
    }
    
    if (begin == null) {
      return end!;
    }
    
    return begin!.lerp(end!, t);
  }
}
''';
}
