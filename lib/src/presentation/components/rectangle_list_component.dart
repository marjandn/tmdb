import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

import '../../app/config/colors/colors.dart';

class RectangleListComponent extends StatelessWidget {
  const RectangleListComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => SizedBox(
          width: 180,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: context.appTheme.shadowColor,
                            blurRadius: 5,
                            offset: const Offset(0, 4)),
                        BoxShadow(
                            color: context.appTheme.shadowColor,
                            blurRadius: 5,
                            offset: const Offset(0, -1)),
                      ],
                      image: const DecorationImage(
                          image: AssetImage("assets/images/film_cover.jpg"), fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "Braking BadBraking Bad",
                    textAlign: TextAlign.center,
                    style: context.appTheme.textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.goldColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "3.8",
                      style: context.appTheme.textTheme.labelMedium,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
