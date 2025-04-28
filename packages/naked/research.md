# Component Research

This document outlines a comprehensive analysis of UI components, their interactive states, current value states, and event callbacks.

## Full List of Components

| **Component / Sub‑component** | **Interactive States** | **Current Value States** | **Event Callbacks** |
| --- | --- | --- | --- |
| **Avatar** | – | Label content; image presence | – |
| **Badge** | – | Badge label content | – |
| **Card / Container** | – | – | – |
| **Divider** | – | – | – |
| **Grid Tile** | *(Determined by which child widgets are present – static layout)* | Presence/absence of title, subtitle, metadata, actions, icons | – |
| **Header** | – | – | – |
| **Header (Scrolling)** | – | – | – |
| **List Tile** | *(Based on which child widgets are provided – static configuration)* | Presence/absence of title, subtitle, leading, trailing | – |
| **License Page** | – | – | – |
| **Button** | Enabled, Hovered, Focused, Activated | – | onPressed |
| **Checkbox** | Enabled, Hovered, Focused, Activated | Checked state (checked, unchecked, or indeterminate) | Toggle handler |
| **Menu Item** | Enabled, Hovered, Focused, Activated | – | Implicit selection/dismissal |
| **Radio Button** | Enabled, Hovered, Focused, Activated | Selected state (whether this option is chosen) | Toggle handler |
| **Tooltip** | Visibility; relative position (to target widget) | – | – |
| **Page Indicator (Main)** | – | Total page count; current page index | Page selection handler |
| **Page Indicator – Sub‑item** | Focused, Hovered, Active | – | (Implicit within overall selection) |
| **Ratings (Main)** | – | Current rating (e.g. 1–5) | Value change handler |
| **Rating Symbol (Sub‑item)** | Focused, Hovered, Active | – | – |
| **Slider** | Focused, Hovered, Active | Minimum value; maximum value; current value; tick mark labels; minimum step | Value change handler |
| **Switch** | Enabled, Hovered, Focused, Activated | Current on/off value; current delta (while dragging) | Toggle handler |
| **Bottom Bar (Main)** | – | Selected item index; (total items implied by layout) | Value change handler |
| **Bottom Bar Item (Sub‑item)** | Enabled, Focused, Hovered, Activated | *(Item's index and selection flag are implicit)* | – |
| **Combo Box (Main)** | – | Current selected item | Value change handler |
| **Combo Box – Button Part** | Openness, Enabled, Focused, Hovered, Active | – | – |
| **Combo Box – Popup Part** | Openness | – | – |
| **Combo Box – Item (Sub‑item)** | Enabled, Focused, Hovered, Active, Selected | – | – |
| **Dialogs** | Visibility | – | (Dismissal handled internally) |
| **Disclosure** | Openness | – | (Toggles on tap; implicit behavior) |
| **Drawer** | Openness | – | (Interaction via drag/scrim tap) |
| **Dropdown (Main)** | – | Current selected item | Value change handler |
| **Dropdown – Button Part** | Openness, Enabled, Focused, Hovered, Active | – | – |
| **Dropdown – Popup Part** | Openness | – | – |
| **Dropdown – Item (Sub‑item)** | Enabled, Focused, Hovered, Active, Selected | – | – |
| **List Box (Main)** | – | Selected item(s) (depending on single or multi–select mode) | Value change handler |
| **List Box – Container** | Enabled, Focused, Hovered; *(plus selection mode: single/multi)* | – | – |
| **List Box – Item** | Enabled, Focused, Hovered, Activated, Selected | – | – |
| **Popup Menu** | Visibility | – | (Dismissal implicit upon selection) |
| **Reorderable List (Main)** | – | Current ordering of items | Value change handler (for reordering) |
| **Reorderable List – Container** | Enabled, Focused, Hovered | – | – |
| **Reorderable List – Item** | Focused, Hovered, Activated, Moving | – | – |
| **Scroll Bar (Main)** | – | Scroll metrics; axis direction | – |
| **Scroll Bar – Associated List View** | Hovered, Scrolling | – | – |
| **Scroll Bar – Itself** | Hovered, Active | – | – |
| **Segmented Control (Main)** | – | Selected segment index; total segments | Value change handler |
| **Segmented Control – Segment (Sub‑item)** | Enabled, Focused, Hovered, Activated | – | – |
| **Tabs (Main)** | – | Selected tab index; total tabs | Value change handler |
| **Tab (Sub‑item)** | Enabled, Focused, Hovered, Activated | – | – |
| **Text Field** | Enabled, Focused, Hovered | Current text value | (Managed via text editing controller) |
| **Tree View** | *(Not explicitly defined)* | – | – |
| **Notification Popup** | Visibility | – | (Auto-dismiss via timer) |
| **Sheets** | Visibility | – | (Optional dismissal via external tap) |
| **Splitter** | – | – | – |
| **About Box** | – | – | – |
| **Color Picker (Main)** | – | Current color value | Value change handler |
| (Sub‑components not detailed)* | – | – | – |
| **Date/Time Pickers** | *(Typically a minimal interactive "trigger" button)* | Current selected date/time | Value change handler |
| **Search Field** | Enabled, Focused, Hovered | Current text value | Value change handler |
| **Spinner** | *(Interactivity provided via its increment/decrement buttons)* | Current numeric value | Value change handler |
| **Table** | – | – | – |
| **Button Layout** | – | – | – | 