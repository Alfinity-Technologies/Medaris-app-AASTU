// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medersa_app/app.dart';

void main() {
  testWidgets('starts with the empty four-tab app shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: CampusMedresaApp()));

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Qirat'), findsOneWidget);
    expect(find.text('Events'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Your learning hub'), findsNothing);

    for (final tab in ['Qirat', 'Events', 'Profile', 'Home']) {
      await tester.tap(find.text(tab));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Qirat'), findsOneWidget);
      expect(find.text('Events'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Your learning hub'), findsNothing);
    }
  });
}
