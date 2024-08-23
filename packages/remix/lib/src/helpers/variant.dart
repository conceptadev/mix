import 'package:mix/mix.dart';

abstract class RemixVariant extends Variant {
  const RemixVariant(String name) : super('remix.$name');

  String get label => name.split('.').last;
}
