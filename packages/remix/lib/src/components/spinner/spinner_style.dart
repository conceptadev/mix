// ignore_for_file: avoid-unnecessary-call

part of 'spinner.dart';

class SpinnerStyle extends SpecStyle<SpinnerSpecUtility> {
  const SpinnerStyle();

  @override
  Style makeStyle(SpecConfiguration<SpinnerSpecUtility> spec) {
    final $ = spec.utilities;

    final spinnerStyle = [
      $.chain
        ..size(24)
        ..strokeWidth(1.5)
        ..color.black(),
    ];

    return Style.create([
      ...spinnerStyle,
    ]);
  }
}
