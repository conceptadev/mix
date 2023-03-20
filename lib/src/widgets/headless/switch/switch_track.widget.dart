part of 'switch.widget.dart';

final _trackTheme = MixTokens.headless.switchX.track;

/// The track of the switch (the part that stays still when the switch is toggled)
///
/// The track is a [Box] widget with a default size of 40x20,
/// and can be customized by passing a [Mix] to the [mix] parameter.
class SwitchXTrack extends MixableWidget {
  const SwitchXTrack({
    Key? key,
    Mix? mix,
    this.child = const SizedBox.shrink(),
  })  : _mix = mix,
        super(mix, key: key);

  Size get size => Size(
        mix.toList().whereType<BoxAttributes>().first.width ??
            _trackTheme.size.width,
        mix.toList().whereType<BoxAttributes>().first.height ??
            _trackTheme.size.height,
      );

  /// The [ThumbThemeData].
  Mix get themeMix => _trackTheme.toMix();

  /// The combination of the [mix] and the [ThumbThemeData] mix.
  Mix get mix => themeMix.maybeApply(_mix);

  final Mix? _mix;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final trackMixBoxAttrs = mix //
        .toList()
        .whereType<BoxAttributes>();

    assert(
      (trackMixBoxAttrs.length == 1),
      'SwitchX bgMix parameter should have only one BoxAttribute',
    );

    assert(
      trackMixBoxAttrs.first.height != null &&
          trackMixBoxAttrs.first.width != null,
      'SwitchX bgMix parameter must have height and width attributes',
    );

    return Box(
      mix: mix,
      child: child,
    );
  }
}
