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
    spec as TextFieldSpecConfiguration;

    final $ = spec.utilities;

    final containerStyle = $.container.chain
      // ..height(80)
      ..color.white()
      ..padding.horizontal(12)
      ..padding.vertical(8)
      ..borderRadius(6)
      ..border.all.color.grey.shade300()
      ..shadow.spreadRadius(0)
      ..shadow.blurRadius(2)
      ..shadow.offset(-1, 1)
      ..shadow.color.grey.shade200();

    final layoutStyle = $.containerLayout.chain
      ..direction.vertical()
      ..mainAxisSize.min()
      ..mainAxisAlignment.start()
      ..crossAxisAlignment.start()
      ..gap(6);

    final contentLayoutStyle = $.contentLayout.chain
      ..direction.horizontal()
      ..mainAxisSize.min()
      ..mainAxisAlignment.start()
      ..crossAxisAlignment.center()
      ..gap(6);

    final textStyle = $.chain
      ..style.color.black87()
      ..style.fontSize(14);

    final hintStyle = $.hintText.chain
      ..style.color.black54()
      ..style.fontSize(14);

    final helperStyle = $.helperText.chain
      ..style.color.black54()
      ..style.fontSize(12)
      ..wrap.padding.left(12);

    final focus = spec.on.focus($.container.border.all.color.black());

    return Style(
      platformSettings(spec).call(),
      containerStyle,
      $.floatingLabel.on(),
      contentLayoutStyle,
      layoutStyle,
      textStyle,
      helperStyle,
      hintStyle,
      $.selectionColor.black12(),
      focus,
    );
  }
}
