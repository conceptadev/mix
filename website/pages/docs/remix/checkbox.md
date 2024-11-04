# Checkbox

The `Checkbox` component is a widget that allows users to toggle an option on and off.

## Usage

{{A playground example}}

```dart
//...
bool _value = false;
@override
Widget build(BuildContext context) {

  return Checkbox(
    value: _value,
    onChanged: (value) {
      setState(() {
        _value = value;
      });
    },
    label: 'Remember me',
  );
}
```

## Properties

| Property | Type | Description |
| -------- | -------- | -------- |
| `value` | `bool` | Whether the checkbox is checked. |
| `onChanged` | `ValueChanged<bool>?` | The callback function that is called when the checkbox is tapped. |
| `label` | `String?` | The label of the checkbox. |
| `disabled` | `bool` | Whether the checkbox is disabled. |
| `iconChecked` | `IconData` | The icon to display when the checkbox is checked. |
| `iconUnchecked` | `IconData?` | The icon to display when the checkbox is unchecked. |
| `style` | `CheckboxStyle?` | The style of the checkbox. |
| `variants` | `List<Variant>` | The variants of the checkbox. |

## Customization
As all remix's components, the `Checkbox` component can be customized using the `style` and `variants` properties.

{{A customization example}}

The attributes that can be customized are the following:

### layout
This property controls the layout of the checkbox. It corresponds to the `FlexSpec` class, allowing you to utilize all the style properties available in `Flex` to customize the checkbox's layout.

### indicatorContainer
This property controls the container that wraps the indicator of the checkbox. It corresponds to the `BoxSpec` class, allowing you to utilize all the style properties available in `Box` to customize the checkbox's indicator container.

### indicatorIcon
This property controls the icon of the checkbox. It corresponds to the `IconSpec` class, allowing you to utilize all the style properties available in `StyledIcon` to customize the checkbox's indicator icon.

### label
This property controls the label of the checkbox. It corresponds to the `TextSpec` class, allowing you to utilize all the style properties available in `StyledText` to customize the checkbox's label.
