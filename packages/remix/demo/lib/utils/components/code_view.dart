import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';

class CodeView extends StatelessWidget {
  const CodeView({
    super.key,
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $with.padding.horizontal(24),
        $box.padding(16),
        $box.color(const Color(0xFF141726)),
        $box.borderRadius(15),
      ),
      child: SizedBox(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: SelectableText.rich(
            dartLightHighlighter.highlight(code),
            style: GoogleFonts.firaCode(
              fontSize: 13,
              height: 1.3,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
