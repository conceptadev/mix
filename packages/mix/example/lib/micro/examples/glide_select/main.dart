import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Paste this entire file into https://dartpad.dev/ to run the example.
void main() => runApp(const _MicroExampleApp());

class _MicroExampleApp extends StatelessWidget {
  const _MicroExampleApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: microMaterialTheme(),
      builder: (context, child) =>
          MixScope(colors: microColors(), radii: microRadii(), child: child!),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(padding: EdgeInsets.all(24), child: GlideSelect()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $hover = ColorToken('micro.hover');
const $radiusXs = RadiusToken('micro.radius.xs');
const $radiusSm = RadiusToken('micro.radius.sm');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
  $hover: const Color(0xFF32323C),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusXs: const Radius.circular(8),
  $radiusSm: const Radius.circular(10),
};

ThemeData microMaterialTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C6AF7),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF07070B),
    useMaterial3: true,
  );
}

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class GlideSelect extends StatefulWidget {
  const GlideSelect({super.key});

  @override
  State<GlideSelect> createState() => _GlideSelectState();
}

class _GlideSelectState extends State<GlideSelect> {
  static const _items = ['Gemini', 'Claude', 'Grok'];
  final _overlay = OverlayPortalController();
  final _anchor = LayerLink();
  Timer? _closing;
  int _selected = 0;
  int _hover = 0;
  bool _open = false;

  @override
  void dispose() {
    _closing?.cancel();
    super.dispose();
  }

  void _close() {
    setState(() => _open = false);
    _closing?.cancel();
    _closing = Timer(120.ms, _overlay.hide);
  }

  void _toggle() {
    if (_open) return _close();
    _closing?.cancel();
    _hover = _selected;
    if (_overlay.isShowing) {
      setState(() => _open = true);
    } else {
      _overlay.show();
      // Mount the collapsed style first so Mix can interpolate its entrance.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _overlay.isShowing) setState(() => _open = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      groupId: _anchor,
      onTapOutside: (_) {
        if (_open) _close();
      },
      child: OverlayPortal(
        controller: _overlay,
        overlayChildBuilder: (context) => Positioned(
          width: 176,
          child: CompositedTransformFollower(
            link: _anchor,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: const Offset(0, 6),
            showWhenUnlinked: false,
            child: TapRegion(
              groupId: _anchor,
              child: IgnorePointer(
                ignoring: !_open,
                child: ExcludeSemantics(
                  excluding: !_open,
                  child: Box(
                    key: const Key('glide-menu'),
                    style: BoxStyler()
                        .width(176)
                        .color($track())
                        .borderRadiusAll($radiusSm())
                        .paddingAll(4)
                        .border(.color(const Color(0x22FFFFFF)).width(1))
                        .wrap(WidgetModifierConfig.opacity(_open ? 1 : 0))
                        .wrap(
                          WidgetModifierConfig.scale(
                            x: _open ? 1 : .95,
                            y: _open ? 1 : .95,
                            alignment: Alignment.topLeft,
                          ),
                        )
                        .animate(.easeOut(_open ? 180.ms : 120.ms)),
                    child: StackBox(
                      style: StackBoxStyler().stackAlignment(.topLeft),
                      children: [
                        Box(
                          key: const Key('glide-highlight'),
                          style: BoxStyler()
                              .height(30)
                              .width(166)
                              .color($hover())
                              .borderRadiusAll($radiusXs())
                              .translate(0, _hover * 31)
                              .animate(.easeOut(220.ms)),
                        ),
                        ColumnBox(
                          style: FlexBoxStyler().spacing(1).mainAxisSize(.min),
                          children: [
                            for (var i = 0; i < _items.length; i++)
                              MouseRegion(
                                onEnter: (_) => setState(() => _hover = i),
                                child: PressableBox(
                                  onPress: () {
                                    setState(() {
                                      _selected = i;
                                      _hover = i;
                                    });
                                    _close();
                                  },
                                  style: BoxStyler()
                                      .height(30)
                                      .paddingX(10)
                                      .alignment(.centerLeft),
                                  child: StyledText(
                                    _items[i],
                                    style: microLabel(13),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        child: TapRegion(
          groupId: _anchor,
          child: CompositedTransformTarget(
            link: _anchor,
            child: PressableBox(
              key: const Key('glide-select'),
              onPress: _toggle,
              style: BoxStyler()
                  .width(128)
                  .height(32)
                  .paddingX(10)
                  .borderRadiusAll($radiusXs())
                  .color($track())
                  .onHovered(.color($hover()))
                  .onPressed(.scale(.97))
                  .animate(.easeOut(160.ms)),
              child: RowBox(
                style: FlexBoxStyler()
                    .mainAxisAlignment(.spaceBetween)
                    .crossAxisAlignment(.center),
                children: [
                  StyledText(_items[_selected], style: microLabel(13)),
                  Box(
                    style: BoxStyler()
                        .rotate(_open ? 3.141592653589793 : 0)
                        .animate(.easeOut(200.ms)),
                    child: StyledIcon(
                      icon: Icons.expand_more_rounded,
                      style: IconStyler().size(18).color($muted()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
