part of 'progress.dart';

abstract interface class IProgressVariant extends RemixVariant {
  const IProgressVariant(String name) : super('progress.$name');
}

class ProgressVariant extends IProgressVariant {
  const ProgressVariant(String name) : super('variant.$name');

  static const surface = ProgressVariant('surface');
  static const soft = ProgressVariant('soft');

  static List<ProgressVariant> get values => [surface, soft];
}

class ProgressSize extends IProgressVariant {
  const ProgressSize(String name) : super('size.$name');

  static const size1 = ProgressSize('size1');
  static const size2 = ProgressSize('size2');
  static const size3 = ProgressSize('size3');

  static List<ProgressSize> get values => [size1, size2, size3];
}

class ProgressRadius extends IProgressVariant {
  const ProgressRadius(String name) : super('radius.$name');

  static const none = ProgressRadius('none');
  static const small = ProgressRadius('small');
  static const medium = ProgressRadius('medium');
  static const large = ProgressRadius('large');
  static const full = ProgressRadius('full');

  static List<ProgressRadius> get values => [none, small, medium, large, full];
}
