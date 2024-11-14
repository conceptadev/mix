part of '../accordion.dart';

class AccordionHeaderSpecWidget extends StatelessWidget {
  const AccordionHeaderSpecWidget({
    super.key,
    this.leadingIcon,
    required this.title,
    this.trailingIcon,
    required this.spec,
  });

  final String title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final AccordionHeaderSpec spec;

  @override
  Widget build(BuildContext context) {
    final FlexContainerWidget = spec.flexContainer;
    final LeadingIconWidget = spec.leadingIcon;
    final TrailingIconWidget = spec.trailingIcon;
    final TitleWidget = spec.text;

    return FlexContainerWidget(
      direction: Axis.horizontal,
      children: [
        if (leadingIcon != null) LeadingIconWidget(leadingIcon),
        TitleWidget(title),
        const Spacer(),
        TrailingIconWidget(trailingIcon),
      ],
    );
  }
}
