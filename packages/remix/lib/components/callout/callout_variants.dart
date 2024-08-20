part of 'callout.dart';

abstract interface class ICalloutVariant extends RemixVariant {
  const ICalloutVariant(String name) : super('callout.$name');
}

class CalloutVariant extends ICalloutVariant {
  static const soft = CalloutVariant('soft');
  static const surface = CalloutVariant('surface');
  static const outline = CalloutVariant('outline');

  const CalloutVariant(String name) : super('variant.$name');

  static List<CalloutVariant> get values => [soft, surface, outline];
}
