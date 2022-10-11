import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: context.appTheme.focusColor,
      unselectedItemColor: context.appTheme.secondaryHeaderColor,
      selectedLabelStyle: context.appTheme.textTheme.labelMedium,
      unselectedLabelStyle: context.appTheme.textTheme.labelSmall,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: context.appTheme.secondaryHeaderColor,
          ),
          activeIcon: Icon(
            Icons.home_rounded,
            color: context.appTheme.focusColor,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
            color: context.appTheme.secondaryHeaderColor,
          ),
          activeIcon: Icon(
            Icons.search_rounded,
            color: context.appTheme.focusColor,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.theater_comedy_rounded,
            color: context.appTheme.secondaryHeaderColor,
          ),
          activeIcon: Icon(
            Icons.theater_comedy_rounded,
            color: context.appTheme.focusColor,
          ),
          label: "Generes",
        ),
      ],
    );
  }
}
