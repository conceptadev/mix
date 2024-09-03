part of 'spinner.dart';

class XSpinnerStyle {
  static Style get base => Style(
        $spinner.chain
          ..size.call(24)
          ..strokeWidth.call(1.5)
          ..color.black(),
      );
}
