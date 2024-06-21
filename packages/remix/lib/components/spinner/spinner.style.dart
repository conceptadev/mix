import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/spinner/spinner_spec.dart';

final _spinner = SpinnerSpecUtility.self;

Style get defaultSpinnerStyle => Style(
      _spinner.strokeWidth(2),
      _spinner.color(Colors.black),
      _spinner.size(24),
    );
