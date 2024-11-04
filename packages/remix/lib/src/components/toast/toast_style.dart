part of 'toast.dart';

class ToastStyle extends SpecStyle<ToastSpecUtility> {
  const ToastStyle();

  @override
  Style makeStyle(SpecConfiguration<ToastSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = $.container.chain
      ..borderRadius(6)
      ..color.white()
      ..border.all.color.black12()
      ..padding.all(16)
      ..margin.all(20)
      ..constraints.minWidth(300);

    final layoutFlexStyle = $.layout.chain
      ..direction.horizontal()
      ..mainAxisAlignment.spaceBetween()
      ..mainAxisSize.min()
      ..gap(16);

    final textLayoutFlexStyle = $.textLayout.chain
      ..direction.vertical()
      ..crossAxisAlignment.start()
      ..gap(4)
      ..mainAxisSize.min();

    final titleStyle = $.title.chain
      ..style.bold()
      ..style.fontSize(14);

    final descriptionStyle = $.description.chain
      ..style.fontSize(13)
      ..style.color.black54();

    return Style.create([
      containerStyle,
      layoutFlexStyle,
      textLayoutFlexStyle,
      titleStyle,
      descriptionStyle,
    ]);
  }
}
