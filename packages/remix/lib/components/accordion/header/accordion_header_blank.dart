part of 'accordion_header.dart';

class RxBlankAccordionHeader extends StatelessWidget {
  const RxBlankAccordionHeader({
    super.key,
    this.leadingIcon,
    required this.title,
    this.trailingIcon,
    required this.style,
  });

  final String title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Style style;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      inherit: true,
      style: style,
      // autoHandleWidgetStates: false,
      builder: (context) {
        final spec = AccordionSpec.of(context).headerContainer;

        final ContainerWidget = spec.container;
        final FlexWidget = spec.flex;
        final LeadingIconWidget = spec.leadingIcon;
        final TrailingIconWidget = spec.trailingIcon;
        final TitleWidget = spec.text;

        return ContainerWidget(
          child: FlexWidget(
            direction: Axis.horizontal,
            children: [
              if (leadingIcon != null) LeadingIconWidget(leadingIcon),
              TitleWidget(title),
              Spacer(),
              TrailingIconWidget(trailingIcon),
            ],
          ),
        );
      },
    );
  }
}
