import 'dart:ffi';

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get fullWidthSize => MediaQuery.of(this).size.width;

  double get thirdWidthSize => fullWidthSize / 3;

  double get halfThirdWidthSize => thirdWidthSize / 2;

  double get secondWidthSize => fullWidthSize / 2;

  double get halfSecondWidthSize => secondWidthSize / 2;
}
