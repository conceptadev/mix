part of 'accordion.dart';

class RxAccordion extends StatelessWidget {
  const RxAccordion({
    super.key,
    required this.headerBuilder,
    required this.contentBuilder,
    this.initiallyExpanded = false,
    this.style,
  });

  final RxAccordionHeaderBuilder headerBuilder;
  final RxAccordionContentBuilder contentBuilder;
  final Style? style;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return RxBlankAccordion(
      header: headerBuilder,
      content: contentBuilder,
      initiallyExpanded: initiallyExpanded,
      style: _buildAccordionStyle(style),
    );
  }
}
