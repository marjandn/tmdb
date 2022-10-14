import 'dart:ffi';

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get fullWidthSize => MediaQuery.of(this).size.width;

  double get halfWidthSize => MediaQuery.of(this).size.width / 2;

  double get quarterWidthSize => halfWidthSize / 2;
}
