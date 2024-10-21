part of 'textfield.dart';

class TextFieldStyle extends SpecStyle<TextFieldSpecUtility> {
  const TextFieldStyle();
  Style platformSettings(SpecConfiguration<TextFieldSpecUtility> spec) {
    final $ = spec.utilities;

    final iOS = spec.on.ios(
      $.chain
        ..paintCursorAboveText.on()
        ..cursorOpacityAnimates.on()
        ..cursorRadius(2)
        ..cursorOffset(
          m.iOSHorizontalOffset / MediaQuery.devicePixelRatioOf(spec.context),
          0,
        ),
    );

    final androidAndFuchsia = (spec.on.android | spec.on.fuchsia)(
      $.chain
        ..paintCursorAboveText.off()
        ..cursorOpacityAnimates.off(),
    );

    final macos = spec.on.macos(
      $.chain
        ..paintCursorAboveText.on()
        ..cursorOpacityAnimates.off()
        ..cursorRadius(2)
        ..cursorOffset(
          m.iOSHorizontalOffset / MediaQuery.devicePixelRatioOf(spec.context),
          0,
        ),
    );

    final windows = spec.on.windows(
      $.chain
        ..paintCursorAboveText.off()
        ..cursorOpacityAnimates.off(),
    );

    final linux = spec.on.linux(
      $.chain
        ..paintCursorAboveText.off()
        ..cursorOpacityAnimates.off(),
    );

    return Style(
      androidAndFuchsia,
      iOS,
      macos,
      windows,
      linux,
    );
  }

  @override
  Style makeStyle(SpecConfiguration<TextFieldSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = $.container.chain
      ..color.white()
      ..padding.horizontal(12)
      ..padding.vertical(8)
      ..borderRadius(6)
      ..border.all.color.grey.shade300()
      ..shadow.spreadRadius(0)
      ..shadow.blurRadius(2)
      ..shadow.offset(-1, 1)
      ..shadow.color.grey.shade200();

    final textStyle = $.chain
      ..style.color.black87()
      ..style.fontSize(14);

    final hintStyle = $.hint.chain
      ..style.color.black54()
      ..style.fontSize(14);

    final focus = spec.on.focus($.container.border.all.color.red());
    final hover = spec.on.hover($.container.border.all.color.purple());

    return Style(
      platformSettings(spec).call(),
      textStyle,
      containerStyle,
      hintStyle,
      $.selectionColor.black12(),
      hover,
      focus,
    );
  }
}
