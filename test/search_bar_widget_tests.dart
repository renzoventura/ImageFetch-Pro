import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay/di/setup_dependencies.dart';
import 'package:pixabay/screens/feed_screen/components/search_bar.dart';
import 'package:pixabay/widget_keys/widget_keys.dart';

void main() {
  setUpDependencies();
  group('Search bar tests', () {
    testWidgets('Test Searchbar persist values', (WidgetTester tester) async {
      String valueEntered = "Test Search";
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: FeedSearchBar(), // Use your FeedSearchBar widget here
            ),
          ),
        ),
      );

      // Verify that the widget is rendered on the screen
      expect(find.byType(FeedSearchBar), findsOneWidget);
      // Find the TextFormField
      final searchField = find.byType(TextFormField);
      expect(searchField, findsOneWidget);
      // Enter text into the TextFormField and trigger onChanged
      await tester.enterText(searchField, valueEntered);
      await tester.pump();

      //need this timer due to debouncer :(
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify that the text still exists
      expect(find.text(valueEntered), findsOneWidget);
    });

    testWidgets("Clear-all widget clears Searchbars text",
        (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: FeedSearchBar(), // Use your FeedSearchBar widget here
            ),
          ),
        ),
      );

      expect(find.byType(FeedSearchBar), findsOneWidget);
      final searchField = find.byType(TextFormField);
      expect(searchField, findsOneWidget);
      await tester.enterText(searchField, 'Test Search');
      await tester.pump();

      //find clear button and tap it
      final clearButton = find.byKey(WidgetKeys.clearSearch);
      expect(clearButton, findsOneWidget);
      await tester.tap(clearButton);
      await tester
          .pumpAndSettle(const Duration(seconds: 1)); //due to debouncer timer

      // Verify that the text is cleared
      expect(find.text(''), findsOneWidget);
    });
  });
}
