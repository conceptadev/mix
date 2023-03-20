part of 'switch.widget.dart';

/// The following two context variants are used to conditionally include
/// widgets in the tree based on the state of the SwitchXNotifier.
/// If the notifier is active, the widget using the [onActive] variant will be included,
/// and if it's not active, the widget using the [onNotActive] variant will be included.
final onActive = ContextVariant('onActive', shouldApply: (context) {
  return SwitchXNotifier.of(context)?.active ?? true;
});

/// The following two context variants are used to conditionally include
/// widgets in the tree based on the state of the SwitchXNotifier.
/// If the notifier is active, the widget using the [onActive] variant will be included,
/// and if it's not active, the widget using the [onNotActive] variant will be included.
final onNotActive = ContextVariant('onNotActive', shouldApply: (context) {
  final active = SwitchXNotifier.of(context)?.active ?? true;

  return !active;
});
