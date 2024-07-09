// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo/components/button_use_case.dart' as _i2;
import 'package:demo/components/checkbox_use_case.dart' as _i3;
import 'package:demo/components/radio_use_case.dart' as _i4;
import 'package:demo/components/spinner_use_case.dart' as _i5;
import 'package:demo/components/switch_use_case.dart' as _i6;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'button',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'RxButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Button Component',
              builder: _i2.buildButtonUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'checkbox',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'RxCheckbox',
            useCase: _i1.WidgetbookUseCase(
              name: 'Checkbox Component',
              builder: _i3.buildCheckboxUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'radio',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'RxRadio',
            useCase: _i1.WidgetbookUseCase(
              name: 'Radio Component',
              builder: _i4.buildRadioUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'spinner',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'RxSpinner',
            useCase: _i1.WidgetbookUseCase(
              name: 'Spinner Component',
              builder: _i5.buildSpinnerUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'switch',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'RxSwitch',
            useCase: _i1.WidgetbookUseCase(
              name: 'Switch Component',
              builder: _i6.buildSwitchUseCase,
            ),
          )
        ],
      ),
    ],
  )
];
