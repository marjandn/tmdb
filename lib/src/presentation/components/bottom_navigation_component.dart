import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/bloc/dashboard_bloc.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("bottom_navigation_component build now!");
    return BottomNavigationBar(
      selectedItemColor: context.appTheme.focusColor,
      unselectedItemColor: context.appTheme.secondaryHeaderColor,
      selectedLabelStyle: context.appTheme.textTheme.labelMedium,
      unselectedLabelStyle: context.appTheme.textTheme.labelSmall,
      backgroundColor: context.appTheme.primaryColor,
      elevation: 0,
      currentIndex: context.watch<DashboardBloc>().currentBottomItemIndex,
      onTap: (value) =>
          context.read<DashboardBloc>().add(BottomNavigationItemSelect(itemIndex: value)),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/house.png",
            width: 20,
            color: context.appTheme.secondaryHeaderColor,
          ),
          activeIcon: Image.asset(
            "assets/images/house.png",
            width: 20,
            color: context.appTheme.focusColor,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/theater.png",
            width: 24,
            color: context.appTheme.secondaryHeaderColor,
          ),
          activeIcon: Image.asset(
            "assets/images/theater.png",
            width: 24,
            color: context.appTheme.focusColor,
          ),
          label: "Generes",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/search.png",
            width: 20,
            color: context.appTheme.secondaryHeaderColor,
          ),
          activeIcon: Image.asset(
            "assets/images/search.png",
            width: 20,
            color: context.appTheme.focusColor,
          ),
          label: "Search",
        ),
      ],
    );
  }
}
