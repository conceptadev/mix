# Mix Lint

Mix Lint is a powerful tool that helps you enforce coding standards and best practices in your Flutter apps using Mix.

## Getting Started

Run this command in the root of your Flutter project:

```bash
flutter pub add -d mix_lint custom_lint
```

Then edit your `analysis_options.yaml` file and add these lines of code:

```bash
analyzer:
  plugins:
    - custom_lint
```

Then run:

```bash
flutter clean
flutter pub get
dart run custom_lint
```

## Customize rules

Some rules have their own configuration. You can customize them in the `analysis_options.yaml` file. For example, you can customize the rules for the `mix_max_number_of_attributes_per_style` rule.

```yaml filename="analysis_options.dart"
custom_lint:
  rules:
    - mix_max_number_of_attributes_per_style:
      max_number: 11
```