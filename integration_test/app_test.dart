import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tmdb_prj/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Tap on Moon icon, assert the Moon to the Sun", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are in HomePage
    expect(find.text("Today Popular Movies"), findsOneWidget);

    var moonIcon = find.byIcon(Icons.nightlight_round);
    expect(moonIcon, findsOneWidget);

    await tester.tap(moonIcon);
    await tester.pump();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(moonIcon, findsNothing);

    // Verify theme changes compeletly
    expect(find.byIcon(Icons.sunny), findsOneWidget);
  });
}
