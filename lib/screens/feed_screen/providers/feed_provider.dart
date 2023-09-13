import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay/constants/constants.dart';
import 'package:pixabay/di/setup_dependencies.dart';
import 'package:pixabay/models/pixabay_response.dart';
import 'package:pixabay/screens/feed_screen/providers/feed_state.dart';
import 'package:pixabay/service/api/pixabay_api_service.dart';

final feedProvider = StateNotifierProvider<FeedProvider, FeedState>((ref) {
  return FeedProvider();
});

class FeedProvider extends StateNotifier<FeedState> {
  PixabayApiService api = getIt<PixabayApiService>();

  FeedProvider()
      : super(FeedState(
          feeds: [],
          isLoading: false,
          errorMessage: "",
        ));

  Future<void> getImages(String searchString) async {
    try {
      updateIsLoadingVisible(true);
      var test = await api.getHits(searchString);
      //await Future.delayed(Duration(seconds: 1)); //Delayed to show loading indicator for testing purposes
      updateIsLoadingVisible(false);
      PixabayResponse response = PixabayResponse.fromJson(test.data);
      state = state.copyWith(feeds: response.hits);

      //Update error message if result is null
      if (response.hits.isEmpty) {
        state = state.copyWith(errorMessage: noResults);
      }
    } catch (e) {
      //show error message if api fails
      state = state.copyWith(
        feeds: [],
        errorMessage: failedToRetrieveData,
      );
      updateIsLoadingVisible(false);
    }
  }

  void updateIsLoadingVisible(bool value) async {
    state = state.copyWith(isLoading: value);
  }
}
