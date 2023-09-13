import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pixabay/constants/constants.dart';
import 'package:pixabay/di/setup_dependencies.dart';
import 'package:pixabay/main.dart' as app;
import 'package:pixabay/widget_keys/widget_keys.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'End to end integration tests',
    () {
      setUpDependencies();
      testWidgets(
        'Verify "No Result" does not show up on first start up',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: app.MyApp()));
          await tester.pumpAndSettle();
          expect(find.text(noResults), findsNothing);
        },
      );

      testWidgets(
        'Verify searchBar text is cleared using clear all button',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: app.MyApp()));

          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.searchBar), findsOneWidget);
          final searchField = find.byType(TextFormField);
          expect(searchField, findsOneWidget);
          await tester.enterText(searchField, 'Test Search');
          await tester.pump();

          //find clear button and tap it
          final clearButton = find.byKey(WidgetKeys.clearSearch);
          expect(clearButton, findsOneWidget);
          await tester.tap(clearButton);
          await tester.pumpAndSettle(
              const Duration(seconds: 1)); //due to debouncer timer

          // Verify that the text is cleared
          expect(find.text(''), findsOneWidget);
        },
      );

      testWidgets(
        'Verify feed is not retrieved when entering less than 4 characters',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: app.MyApp()));

          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.searchBar), findsOneWidget);
          final searchField = find.byType(TextFormField);
          expect(searchField, findsOneWidget);
          await tester.enterText(searchField, 'Bee');
          await tester.pump();

          await tester.pumpAndSettle(
              const Duration(seconds: 1)); //due to debouncer timer
          expect(find.byKey(WidgetKeys.pixabayItem), findsNothing);
        },
      );

      testWidgets(
        'Verify that "No Result" message pops up if api returns empty list',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: app.MyApp()));

          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.searchBar), findsOneWidget);
          final searchField = find.byType(TextFormField);
          expect(searchField, findsOneWidget);
          await tester.enterText(searchField,
              'asdasdasd'); //returns empty list from backend as of 13/09/2023
          await tester.pump();

          await tester.pumpAndSettle(
              const Duration(seconds: 1)); //due to debouncer timer
          expect(find.text(noResults), findsOneWidget);
        },
      );

      testWidgets(
        'Verify feed displays only 1 result for Dragon2',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: app.MyApp()));

          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.searchBar), findsOneWidget);
          final searchField = find.byType(TextFormField);
          expect(searchField, findsOneWidget);
          await tester.enterText(
              searchField, 'Dragon2'); //returns 1 from backend as of 13/09/2023
          await tester.pump();

          await tester.pumpAndSettle(
              const Duration(seconds: 1)); //due to debouncer timer
          expect(find.byKey(WidgetKeys.pixabayItem), findsOneWidget);
        },
      );

      testWidgets(
        'Verify feed displays at least 2 results for Beer',
        (tester) async {
          await tester.pumpWidget(const ProviderScope(child: app.MyApp()));

          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.searchBar), findsOneWidget);
          final searchField = find.byType(TextFormField);
          expect(searchField, findsOneWidget);
          await tester.enterText(searchField, 'Beer');
          await tester.pump();

          await tester.pumpAndSettle(
              const Duration(seconds: 1)); //due to debouncer timer
          expect(find.byKey(WidgetKeys.pixabayItem),
              findsNWidgets(2)); //since can only detect widgets in screen
        },
      );

      //Following test cases will fail (for testing purposes)
      // testWidgets(
      //   'Verify that "No Result" message pops up if api returns empty list',
      //       (tester) async {
      //     await tester.pumpWidget(const ProviderScope(child: app.MyApp()));
      //
      //     await tester.pumpAndSettle();
      //     expect(find.byKey(WidgetKeys.searchBar), findsOneWidget);
      //     final searchField = find.byType(TextFormField);
      //     expect(searchField, findsOneWidget);
      //     await tester.enterText(searchField,
      //         'asdasdasd'); //returns empty list from backend as of 13/09/2023
      //     await tester.pump();
      //
      //     await tester.pumpAndSettle(
      //         const Duration(seconds: 1)); //due to debouncer timer
      //     expect(find.text(noResults), findsNothing);
      //   },
      // );
    },
  );
}
