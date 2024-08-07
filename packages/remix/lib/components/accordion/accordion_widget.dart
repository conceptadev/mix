part of 'accordion.dart';

class RxAccordion extends StatelessWidget {
  const RxAccordion({
    super.key,
    required this.title,
    this.leadingIcon,
    this.trailingIcon = Icons.keyboard_arrow_down_rounded,
    required this.content,
    this.initiallyExpanded = false,
    this.style,
  });

  final String title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Widget content;
  final Style? style;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return RxBlankAccordion(
      header: (context, spec) => RxAccordionHeaderSpecWidget(
        title: title,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        spec: spec,
      ),
      content: content,
      initiallyExpanded: initiallyExpanded,
      style: _buildAccordionStyle(style),
    );
  }
}
