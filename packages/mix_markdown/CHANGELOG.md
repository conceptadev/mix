## 0.0.1-alpha.0

- Adds `MixMarkdown`, which parses a Markdown document once and renders
  paragraphs, headings, nested inline formatting, and GitHub alerts.
- Adds generated `MarkdownSpec`, `MarkdownAlertSpec`, and
  `MarkdownAlertTypeSpec` with fluent Stylers for every slot.
- Adds `MarkdownSyntax` for parser configuration and an
  `unsupportedBuilder` hook for documents that use other block types.
