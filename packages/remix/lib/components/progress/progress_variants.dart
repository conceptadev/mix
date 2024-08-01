part of 'progress.dart';

abstract interface class IProgressVariant extends RemixVariant {
  const IProgressVariant(super.name);
}

class ProgressVariant extends IProgressVariant {
  const ProgressVariant(super.name);

  static const classic = ProgressVariant('remix.progress.classic');
  static const surface = ProgressVariant('remix.progress.surface');
  static const soft = ProgressVariant('remix.progress.soft');

  static List<ProgressVariant> get values => [classic, surface, soft];
}

class ProgressSize extends IProgressVariant {
  const ProgressSize(super.name);

  static const small = ProgressSize('remix.progress.small');
  static const medium = ProgressSize('remix.progress.medium');
  static const large = ProgressSize('remix.progress.large');

  static List<ProgressSize> get values => [small, medium, large];
}

class ProgressRadius extends IProgressVariant {
  const ProgressRadius(super.name);

  static const none = ProgressRadius('remix.progress.none');
  static const small = ProgressRadius('remix.progress.small');
  static const medium = ProgressRadius('remix.progress.medium');
  static const large = ProgressRadius('remix.progress.large');
  static const full = ProgressRadius('remix.progress.full');

  static List<ProgressRadius> get values => [none, small, medium, large, full];
}
