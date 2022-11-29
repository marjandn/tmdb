import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

class AppStyles {
  final BuildContext _context;
  AppStyles(this._context);

  late BoxDecoration imageContainerDecoration = _imageRoundedRecContainerDecoration();
  late BoxDecoration imageOvalContainerDecoration = _imageOvalContainerDecoration();

  BoxDecoration _imageOvalContainerDecoration() => BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: _context.appTheme.shadowColor, blurRadius: 5, offset: const Offset(0, 4)),
          BoxShadow(
              color: _context.appTheme.shadowColor, blurRadius: 5, offset: const Offset(0, -1)),
        ],
      );

  BoxDecoration _imageRoundedRecContainerDecoration() => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
              color: _context.appTheme.shadowColor, blurRadius: 5, offset: const Offset(0, 4)),
          BoxShadow(
              color: _context.appTheme.shadowColor, blurRadius: 5, offset: const Offset(0, -1)),
        ],
      );
}
