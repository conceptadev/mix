part of 'switch.widget.dart';

final _thumbTheme = MixTokens.headless.switchX.thumb;

/// The thumb of the switch (the part that moves when the switch is toggled)
///
/// The thumb is a [Box] widget with a default size of 20x20,
/// and can be customized by passing a [Mix] to the [mix] parameter.
class SwitchXThumb extends MixableWidget {
  const SwitchXThumb({
    Key? key,
    Mix? mix,
    this.child = const SizedBox.shrink(),
  })  : _mix = mix,
        super(mix, key: key);

  Size get size => Size(
        mix.toList().whereType<BoxAttributes>().first.width ??
            _thumbTheme.size.width,
        mix.toList().whereType<BoxAttributes>().first.height ??
            _thumbTheme.size.height,
      );

  /// The combination of the [mix] and the [ThumbThemeData] mix.
  Mix get mix => _thumbTheme.toMix().maybeApply(_mix);

  final Mix? _mix;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final thumbMixAttrs = mix //
        .toList()
        .whereType<BoxAttributes>();

    assert(
      (thumbMixAttrs.length == 1),
      'SwitchX thumbMix parameter should have only one BoxAttribute',
    );

    assert(
      thumbMixAttrs.first.height != null && thumbMixAttrs.first.width != null,
      'SwitchX thumbMix parameter must have height and width attributes',
    );

    final thumbTheme = MixTheme.of(context).headlessThemeData.switchTheme.thumb;
    final themeMixWithCustom = thumbTheme.toMix().maybeApply(_mix);

    return Box(
      mix: themeMixWithCustom,
      child: child,
    );
  }
}
