import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay/di/setup_dependencies.dart';
import 'package:pixabay/models/pixabay_item.dart';
import 'package:pixabay/screens/feed_screen/providers/feed_provider.dart';
import 'package:pixabay/screens/feed_screen/providers/feed_state.dart';

void main() {
  setUpDependencies();
  group('FeedProvider State Tests', () {
    late FeedProvider feedProvider;

    setUp(() {
      feedProvider = FeedProvider();
    });

    test('Initial state should have empty feeds and isLoading false', () {
      final initialState = feedProvider.state;

      expect(initialState.feeds, isEmpty);
      expect(initialState.isLoading, isFalse);
      expect(initialState.errorMessage, isEmpty);
    });

    group('FeedState Tests', () {
      test('copyWith should create a new FeedState with provided values', () {
        final originalState = FeedState(
          feeds: [PixabayItem(id: 1), PixabayItem(id: 2), PixabayItem(id: 3)],
          isLoading: true,
          errorMessage: 'Error',
        );

        final copiedState = originalState.copyWith(
          feeds: [],
          isLoading: false,
          errorMessage: '',
        );

        expect(copiedState.feeds, isEmpty);
        expect(copiedState.isLoading, isFalse);
        expect(copiedState.errorMessage, isEmpty);
      });
    });
  });
}
