# Example

Mix provides a lot of different benefits on how you can define and organize your design tokens, and no documentation would be complete without a syntax comparison between **Mix vs. Without Mix**.

Let's go ahead and take a look at the code. Don't worry about understanding each line, the docs will go into more detail about each item.

## With Mix

```dart
class CustomMixWidget extends StatelessWidget {
  const CustomMixWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Style(
      height(100),
      marginVertical(10),
      elevation(10),
      borderRadius(10),
      backgroundColor($md.colorScheme.primary()),
      text.style($button()),
      text.style.color($md.colorScheme.onPrimary()),
      onHover(
        elevation(2),
        padding(20),
        backgroundColor($md.colorScheme.secondary()),
        text.style.color($md.colorScheme.onSecondary()),
      ),
    );
    return Box(
      mix: style,
      child: const TextMix('Custom Widget'),
    );
  }
}
```

## Without Mix

```dart
class CustomWidget extends StatefulWidget {
  const CustomWidget({
    super.key,
  });

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _isHover = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (event) {
        setState(() => _isHover = true);
      },
      onExit: (event) {
        setState(() => _isHover = false);
      },
      child: Material(
        elevation: _isHover ? 2 : 10,
        child: AnimatedContainer(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 100),
          height: 100,
          padding:
              _isHover ? const EdgeInsets.all(20) : const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: _isHover ? colorScheme.secondary : colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Custom Widget',
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: _isHover
                      ? colorScheme.onSecondary
                      : colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
```
