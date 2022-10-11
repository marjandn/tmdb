import 'package:flutter/material.dart';

import '../../components/bottom_navigation_component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const BottomNavigationComponent(),
    );
  }
}
