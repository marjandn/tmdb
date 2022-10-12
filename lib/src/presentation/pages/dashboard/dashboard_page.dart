import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/generes/generes_page.dart';
import 'package:tmdb_prj/src/presentation/pages/home/home_page.dart';
import 'package:tmdb_prj/src/presentation/pages/search/search_page.dart';

import '../../components/bottom_navigation_component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("dashboard_page build now!");
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        if (state is GeneresSelectedState) return const GeneresPage();
        if (state is SearchSelectedState) return const SearchPage();
        return const HomePage();
      }),
      bottomNavigationBar: const BottomNavigationComponent(),
    );
  }
}
