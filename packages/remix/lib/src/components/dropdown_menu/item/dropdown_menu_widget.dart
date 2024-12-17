part of '../dropdown_menu.dart';

/// A widget that represents an individual item in a [Select] dropdown menu.
///
/// This widget is used internally by the [Select] widget to render each [SelectMenuItem]
/// in its dropdown. It applies styling and layout defined in the [SelectStyle].
///
/// Example usage within [Select]:
/// ```dart
/// Select<String>(
///   value: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
///   items: [
///     SelectMenuItem(
///       value: 'profile',
///       child: SelectMenuItemWidget(
///         icon: Icons.person,
///         text: 'Profile',
///       ),
///     ),
///   ],
/// )
/// ```
class DropdownMenuItem<T> extends StatelessWidget {
  const DropdownMenuItem({
    super.key,
    IconData? icon,
    required this.text,
    required this.value,
  }) : iconData = icon;

  /// The optional icon data to display before the text.
  final IconData? iconData;

  /// The text label to display for this menu item.
  final String text;

  /// The value to return when this item is selected.
  final T value;

  @override
  Widget build(BuildContext context) {
    final item = DropdownMenuSpec.of(context).item;
    final container = item.container;
    final icon = item.icon;
    final text = item.text;

    return container(
      direction: Axis.horizontal,
      children: [if (iconData != null) icon(iconData), text(this.text)],
    );
  }
}
