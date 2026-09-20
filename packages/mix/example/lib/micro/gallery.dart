import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'examples.dart';
import 'theme.dart';
import 'widgets/demo_card.dart';

enum MicroGroup {
  controls('Controls'),
  actions('Actions'),
  motion('Motion'),
  agent('Agent');

  const MicroGroup(this.label);
  final String label;
}

class MicroDemo {
  const MicroDemo({
    required this.title,
    required this.caption,
    required this.group,
    required this.builder,
  });

  final String title;
  final String caption;
  final MicroGroup group;
  final WidgetBuilder builder;

  String get slug => title.toLowerCase().replaceAll(' ', '_');
  String get componentName => title.replaceAll(' ', '');
  String get sourceAsset => 'lib/micro/examples/$slug/main.dart';
}

final microDemos = <MicroDemo>[
  MicroDemo(
    title: 'Squish Switch',
    caption: 'Press to compress; release to spring into a new color.',
    group: MicroGroup.controls,
    builder: (_) => const SquishSwitch(),
  ),
  MicroDemo(
    title: 'Peek Rating',
    caption: 'Sweep the stars to preview, click to commit the rating.',
    group: MicroGroup.controls,
    builder: (_) => const PeekRating(),
  ),
  MicroDemo(
    title: 'Spring Check',
    caption:
        'A spring fills the checkbox while the tick fades and the label strikes.',
    group: MicroGroup.controls,
    builder: (_) => const SpringCheck(),
  ),
  MicroDemo(
    title: 'Rubber Segment',
    caption:
        'A spring slides the selection; keyframes stretch and settle its capsule.',
    group: MicroGroup.controls,
    builder: (_) => const RubberSegment(),
  ),
  MicroDemo(
    title: 'Jelly Radio',
    caption: 'The chosen chip swells and barges its neighbours outward.',
    group: MicroGroup.controls,
    builder: (_) => const JellyRadio(),
  ),
  MicroDemo(
    title: 'Glide Select',
    caption: 'Menu highlight glides between rows instead of blinking in.',
    group: MicroGroup.controls,
    builder: (_) => const GlideSelect(),
  ),
  MicroDemo(
    title: 'Scrub Field',
    caption: 'Drag to scrub a number; tap without moving to type.',
    group: MicroGroup.controls,
    builder: (_) => const ScrubField(),
  ),
  MicroDemo(
    title: 'Code Slots',
    caption:
        'Four digits: 1234 turns green; other codes tilt the slots in error.',
    group: MicroGroup.controls,
    builder: (_) => const CodeSlots(),
  ),
  MicroDemo(
    title: 'Wake Slider',
    caption:
        'Drag across the bars; speed raises a wake around the current value.',
    group: MicroGroup.controls,
    builder: (_) => const WakeSlider(),
  ),
  MicroDemo(
    title: 'Comet Dial',
    caption:
        'Drag horizontally to move the lit head and reveal its comet trail.',
    group: MicroGroup.controls,
    builder: (_) => const CometDial(),
  ),
  MicroDemo(
    title: 'Hold Button',
    caption: 'Hold-to-confirm. The liquid fill rises, then the label swaps.',
    group: MicroGroup.actions,
    builder: (_) => const HoldButton(),
  ),
  MicroDemo(
    title: 'Pulse Heart',
    caption:
        'A keyframed heart contracts and rebounds as the like count changes.',
    group: MicroGroup.actions,
    builder: (_) => const PulseHeart(),
  ),
  MicroDemo(
    title: 'Slide Commit',
    caption: 'Slide to the end; the inset capsule expands into the paid state.',
    group: MicroGroup.actions,
    builder: (_) => const SlideCommit(),
  ),
  MicroDemo(
    title: 'Fuse Button',
    caption: 'Archive crossfades to Undo while an amber outline burns away.',
    group: MicroGroup.actions,
    builder: (_) => const FuseButton(),
  ),
  MicroDemo(
    title: 'Bell Toggle',
    caption: 'The bell rings on keyframes while the pill unfurls.',
    group: MicroGroup.actions,
    builder: (_) => const BellToggle(),
  ),
  MicroDemo(
    title: 'Sling Button',
    caption: 'Pull left past the threshold, then release to send.',
    group: MicroGroup.actions,
    builder: (_) => const SlingButton(),
  ),
  MicroDemo(
    title: 'Dodge Field',
    caption: 'The child flees the pointer, then relents after a few tries.',
    group: MicroGroup.motion,
    builder: (_) => const DodgeField(),
  ),
  MicroDemo(
    title: 'Swipe Row',
    caption: 'Swipe to reveal Delete, or swipe farther to remove the row.',
    group: MicroGroup.motion,
    builder: (_) => const SwipeRow(),
  ),
  MicroDemo(
    title: 'Warm Tooltip',
    caption:
        'First label waits; siblings open instantly while the group is warm.',
    group: MicroGroup.motion,
    builder: (_) => const WarmTooltip(),
  ),
  MicroDemo(
    title: 'Swipe Toast',
    caption: 'Show a timed notification; swipe down to dismiss it early.',
    group: MicroGroup.motion,
    builder: (_) => const SwipeToast(),
  ),
  MicroDemo(
    title: 'Folder Float',
    caption: 'Hover or press: notes spring out from behind the flap.',
    group: MicroGroup.motion,
    builder: (_) => const FolderFloat(),
  ),
  MicroDemo(
    title: 'Branched Menu',
    caption: 'Sections unfold; an accent line travels to whatever you pick.',
    group: MicroGroup.motion,
    builder: (_) => const BranchedMenu(),
  ),
  MicroDemo(
    title: 'Lattice Loader',
    caption: 'A 3×3 lattice advances beside a verb and elapsed time.',
    group: MicroGroup.agent,
    builder: (_) => const LatticeLoader(),
  ),
  MicroDemo(
    title: 'Status Mark',
    caption: 'Idle ring, spinning arc, then a check or a cross.',
    group: MicroGroup.agent,
    builder: (_) => const StatusMark(),
  ),
  MicroDemo(
    title: 'Call Chip',
    caption: 'A linear fill completes a call; run again to show a retry state.',
    group: MicroGroup.agent,
    builder: (_) => const CallChip(),
  ),
  MicroDemo(
    title: 'Prompt Bar',
    caption: 'Composer whose send tile inks, then morphs into a stop square.',
    group: MicroGroup.agent,
    builder: (_) => const PromptBar(),
  ),
  MicroDemo(
    title: 'Voice Pill',
    caption:
        'Hold the mic to reveal a continuously animated synthetic waveform.',
    group: MicroGroup.agent,
    builder: (_) => const VoicePill(),
  ),
  MicroDemo(
    title: 'Thought Line',
    caption: 'Steps appear, then the line settles into “Thought for 1.3s”.',
    group: MicroGroup.agent,
    builder: (_) => const ThoughtLine(),
  ),
  MicroDemo(
    title: 'Refine Frame',
    caption: 'Queued → generating → refining → complete, without layout shift.',
    group: MicroGroup.agent,
    builder: (_) => const RefineFrame(),
  ),
  MicroDemo(
    title: 'Slosh Gauge',
    caption: 'Drag the liquid directly; release to settle its tilted surface.',
    group: MicroGroup.agent,
    builder: (_) => const SloshGauge(),
  ),
];

class MicroGalleryScreen extends StatefulWidget {
  const MicroGalleryScreen({super.key});

  @override
  State<MicroGalleryScreen> createState() => _MicroGalleryScreenState();
}

class _MicroGalleryScreenState extends State<MicroGalleryScreen> {
  MicroGroup? _group;

  @override
  Widget build(BuildContext context) {
    final demos = [
      for (final demo in microDemos)
        if (_group == null || demo.group == _group) demo,
    ];
    final GridBoxStyler catalog = .equalColumns(
      2,
    ).gap(16).onConstraints(.maxWidth(720), .equalColumns(1).gap(12));

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ColumnBox(
            style: FlexBoxStyler()
                .paddingAll(24)
                .spacing(8)
                .crossAxisAlignment(.start),
            children: [
              StyledText('Mix Micro', style: microTitle().fontSize(32)),
              StyledText(
                'The React Bits /c/micro catalog, rebuilt with Mix stylers, springs, and keyframes.',
                style: microMuted(15),
              ),
              const SizedBox(height: 8),
              WrapBox(
                style: WrapBoxStyler().spacing(8).runSpacing(8),
                children: [
                  _FilterChip(
                    label: 'All',
                    selected: _group == null,
                    onPress: () => setState(() => _group = null),
                  ),
                  for (final group in MicroGroup.values)
                    _FilterChip(
                      label: group.label,
                      selected: _group == group,
                      onPress: () => setState(() => _group = group),
                    ),
                ],
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          sliver: SliverToBoxAdapter(
            child: GridBox(
              key: const Key('micro-catalog'),
              style: catalog,
              children: [
                for (final demo in demos)
                  DemoCard(
                    key: Key('demo-${demo.title}'),
                    title: demo.title,
                    caption: demo.caption,
                    sourceAsset: demo.sourceAsset,
                    child: demo.builder(context),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onPress,
  });

  final String label;
  final bool selected;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: onPress,
      style: BoxStyler()
          .paddingX(12)
          .paddingY(8)
          .shapeStadium()
          .color(selected ? $ink() : $track())
          .onPressed(.scale(0.97))
          .animate(.spring(280.ms, bounce: 0.08)),
      child: StyledText(
        label,
        style: TextStyler()
            .fontSize(12)
            .fontWeight(.w600)
            .color(selected ? $page() : $ink()),
      ),
    );
  }
}
