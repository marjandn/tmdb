import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

class CircleListComponent extends StatelessWidget {
  const CircleListComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => SizedBox(
          width: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                          image: AssetImage("assets/images/actor_cover.jpg"), fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    "Angelina July",
                    textAlign: TextAlign.center,
                    style: context.appTheme.textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
