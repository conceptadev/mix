// ignore_for_file: camel_case_types

part of 'callout.dart';

class CalloutStyle extends SpecStyle<CalloutSpecUtility> {
  const CalloutStyle();

  @override
  Style makeStyle(SpecConfiguration<CalloutSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..borderRadius(6)
        ..color.white()
        ..border.all.color.black12(),
    ];

    final flexStyle = [
      $.flex.chain
        ..wrap.padding(12)
        ..gap(8)
        ..mainAxisSize.min()
        ..direction.horizontal(),
    ];

    final iconStyle = [$.icon.color.black(), $.icon.size(16)];

    final textStyle = [
      $.text.chain
        ..style.color.black()
        ..style.fontSize(14)
        ..style.fontWeight.w500(),
    ];

    return Style.create([
      ...containerStyle,
      ...flexStyle,
      ...iconStyle,
      ...textStyle,
    ]);
  }
}
