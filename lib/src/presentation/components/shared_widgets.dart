import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

AppBar baseAppBar({required BuildContext context, String title = ""}) => AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: context.appTheme.primaryColor,
      title: Text(
        title,
        style: context.appTheme.textTheme.titleLarge,
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: context.appTheme.secondaryHeaderColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
