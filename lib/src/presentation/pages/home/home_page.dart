import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/components/circle_list_component.dart';

import '../../components/list_heaeder_component.dart';
import '../../components/rectangle_list_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.appTheme.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_rounded,
            color: context.appTheme.focusColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: const [
          SizedBox(
            height: 16,
          ),
          ListHeaderComponent(
            headerTitle: "Featured Today Movies",
          ),
          SizedBox(
            height: 8,
          ),
          RectangleListComponent(),
          SizedBox(
            height: 32,
          ),
          ListHeaderComponent(headerTitle: "Popular Persons"),
          SizedBox(
            height: 8,
          ),
          CircleListComponent(),
        ]),
      ),
    );
  }
}
