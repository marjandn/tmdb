import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';

class ThemesManager {
  late final Color primaryColor;

  late final Color primaryColorDark;
  late final Color secondryColor;
  late final Color primaryColorLight;
  late final Color focusColor;
  late final Color shadowColor;
  late final TextTheme textTheme;
  late final IconThemeData primaryIconTheme;

  ThemesManager.light()
      : primaryColor = AppColors.primaryColor,
        secondryColor = AppColors.primaryColorDark,
        primaryColorLight = AppColors.secondryColorDark,
        focusColor = AppColors.focusColor,
        shadowColor = AppColors.shadowColorLight,
        textTheme = Typography.blackCupertino.apply(displayColor: AppColors.primaryColorDark),
        primaryIconTheme = const IconThemeData(color: AppColors.primaryColorDark, size: 25);

  ThemesManager.dark()
      : primaryColor = AppColors.primaryColorDark,
        secondryColor = AppColors.primaryColor,
        primaryColorLight = AppColors.secondryColor,
        focusColor = AppColors.focusColor,
        shadowColor = AppColors.shadowColorDark,
        textTheme = Typography.whiteCupertino,
        primaryIconTheme = const IconThemeData(color: AppColors.primaryColor, size: 25);

  ThemeData getTheme() => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        secondaryHeaderColor: secondryColor,
        primaryColorLight: primaryColorLight,
        focusColor: focusColor,
        textTheme: textTheme,
        primaryIconTheme: primaryIconTheme,
        dividerColor: AppColors.grayColor,
        shadowColor: shadowColor,
      );
}
