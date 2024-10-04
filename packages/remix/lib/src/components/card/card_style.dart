part of 'card.dart';

class CardStyle extends SpecStyle<CardSpecUtility> {
  const CardStyle();

  @override
  Style makeStyle(SpecConfiguration<CardSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..borderRadius(4)
        ..color.white()
        ..border.all.color.black12()
        ..padding.all(8),
    ];

    final flexStyle = [
      $.flex.chain
        ..mainAxisSize.min()
        ..direction.vertical(),
    ];

    return Style.create([...containerStyle, ...flexStyle]);
  }
}

class CardDarkStyle extends CardStyle {
  const CardDarkStyle();

  @override
  Style makeStyle(SpecConfiguration<CardSpecUtility> spec) {
    final $ = spec.utilities;

    final containerStyle = [
      $.container.chain
        ..color.black()
        ..border.all.color.white30(),
    ];

    return Style.create([
      super.makeStyle(spec).call(),
      ...containerStyle,
    ]);
  }
}
