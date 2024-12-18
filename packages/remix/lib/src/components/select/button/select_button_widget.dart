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
    final select = context.findAncestorStateOfType<SelectState>();

    if (select == null) {
      throw Exception('SelectButton must be a child of a Select');
    }

    final style = select.widget.style ?? context.remix.components.select;
    final configuration = SpecConfiguration(context, SelectSpecUtility.self);
    final appliedStyle =
        style.makeStyle(configuration).applyVariants(select.widget.variants);

    return Pressable(
      onPress: () {
        select.openMenu();
      },
      child: SpecBuilder(
        style: appliedStyle,
        builder: (context) {
          final button = SelectSpec.of(context).button;

          final container = button.container;
          final label = button.label;
          final icon = button.icon;

          return container(
            direction: Axis.horizontal,
            children: [label(text), icon(trailingIcon)],
          );
        },
      ),
    );
  }
}
