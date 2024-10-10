part of 'dialog.dart';

class DialogStyle extends SpecStyle<DialogSpecUtility> {
  const DialogStyle();

  @override
  Style makeStyle(SpecConfiguration<DialogSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = $.container.chain
      ..padding.all(16)
      ..borderRadius.all(8)
      ..color.white()
      ..constraints.minWidth(300)
      ..constraints.maxWidth(500);

    final mainFlex = $.mainFlex.chain
      ..mainAxisSize.min()
      ..gap(4)
      ..crossAxisAlignment.start()
      ..direction.vertical();

    final actionsFlex = $.actionsFlex.chain
      ..mainAxisSize.max()
      ..mainAxisAlignment.end()
      ..gap(12)
      ..wrap.padding.top(8);

    final titleStyle = $.title.chain
      ..style.fontSize(18)
      ..style.bold()
      ..style.color.black()
      ..maxLines(3);

    final descriptionStyle = $.description.chain
      ..style.fontSize(14)
      ..style.color.black54();

    return Style.create(
      [
        $with.align(alignment: Alignment.center),
        containerStyle,
        mainFlex,
        titleStyle,
        descriptionStyle,
        actionsFlex,
      ],
    );
  }
}
