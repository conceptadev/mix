import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: Padding(padding: EdgeInsets.all(24), child: CodeSlots()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $success = ColorToken('micro.success');
const $danger = ColorToken('micro.danger');
const $radiusMd = RadiusToken('micro.radius.md');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $success: const Color(0xFF3DD68C),
  $danger: const Color(0xFFFF5C7A),
};

Map<RadiusToken, Radius> microRadii() => {$radiusMd: const Radius.circular(12)};

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

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class CodeSlots extends StatefulWidget {
  const CodeSlots({super.key});

  @override
  State<CodeSlots> createState() => _CodeSlotsState();
}

class _CodeSlotsState extends State<CodeSlots> {
  String _code = '';
  String? _status;
  final _focus = FocusNode();

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    final next = value.replaceAll(RegExp(r'[^0-9]'), '');
    setState(() {
      _code = next.length > 4 ? next.substring(0, 4) : next;
      _status = null;
    });
    if (_code.length == 4) {
      setState(() => _status = _code == '1234' ? 'ok' : 'bad');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focus.requestFocus,
      child: StackBox(
        key: const Key('code-slots'),
        style: StackBoxStyler().stackAlignment(.center),
        children: [
          Opacity(
            opacity: 0,
            child: SizedBox(
              width: 1,
              height: 1,
              child: TextField(
                focusNode: _focus,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                keyboardType: TextInputType.number,
                onChanged: _onChanged,
              ),
            ),
          ),
          RowBox(
            style: microRow(spacing: 8),
            children: [
              for (var i = 0; i < 4; i++)
                Box(
                  style: BoxStyler()
                      .size(42, 52)
                      .borderRadiusAll($radiusMd())
                      .alignment(.center)
                      .color(_status == 'ok' ? $success() : $track())
                      .border(
                        .color(
                          _status == 'bad'
                              ? $danger.resolve(context)
                              : const Color(0x22FFFFFF),
                        ).width(1.5),
                      )
                      .scale(_code.length == i ? 1.06 : 1)
                      .rotate(_status == 'bad' ? (i.isEven ? -0.04 : 0.04) : 0)
                      .animate(.spring(280.ms, bounce: 0.2)),
                  child: Box(
                    style: BoxStyler()
                        .translate(0, i < _code.length ? 0 : 6)
                        .wrap(
                          WidgetModifierConfig.opacity(
                            i < _code.length ? 1 : 0,
                          ),
                        )
                        .animate(.easeOut(160.ms)),
                    child: StyledText(
                      i < _code.length ? _code[i] : '',
                      style: microLabel(20),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
