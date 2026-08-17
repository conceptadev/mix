## 0.0.1-beta.2

- Regenerates chart Stylers with source-field metadata and requires the Mix
  release that defines the metadata contract.

## 0.0.1-beta.1

- Adds `PieChartStyler.selectedSliceRadiusOffset` to customize or disable the
  selected-slice expansion while preserving the existing 8-pixel default.

## 0.0.1-beta.0

- Introduces Mix-owned `LineChart`, `BarChart`, and `PieChart` widgets.
- Adds backend-neutral data, axis, viewport, interaction, tooltip, animation,
  selection, and accessibility contracts.
- Adds generated Specs and fluent Stylers for line/area, grouped/stacked/
  floating bar, and pie/donut presentation.
- Keeps `fl_chart` behind a private adapter boundary; consumers use no renderer
  types.
- Adds a polished gallery, interactive playground, dashboard, screenshots,
  release wiring, and publish-readiness verification.
