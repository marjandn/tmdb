import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

class ListHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final Function? seeAllCallback;
  final bool showSeeall;

  const ListHeaderWidget({
    required this.headerTitle,
    this.showSeeall = true,
    this.seeAllCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              headerTitle,
              style: context.appTheme.textTheme.subtitle1,
            ),
          ),
          InkWell(
            onTap: () => seeAllCallback!(),
            child: Text("See All",
                style: context.appTheme.textTheme.subtitle2?.copyWith(
                  color: AppColors.grayColor,
                )),
          ),
        ],
      ),
    );
  }
}
