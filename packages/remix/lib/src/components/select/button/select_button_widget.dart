part of '../select.dart';

class SelectButtonSpecWidget extends StatelessWidget {
  const SelectButtonSpecWidget({
    super.key,
    required this.spec,
    required this.text,
    required this.trailingIcon,
  });

  final SelectButtonSpec spec;
  final String text;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      inherit: true,
      builder: (context) {
        final button = SelectSpec.of(context).button;

        final container = button.container;
        final label = button.label;
        final icon = button.icon;
        final flex = button.layout;

        return container(
          child: flex(
            direction: Axis.horizontal,
            children: [label(text), icon(trailingIcon)],
          ),
        );
      },
    );
  }
}
