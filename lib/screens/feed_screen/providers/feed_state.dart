import 'package:pixabay/models/pixabay_item.dart';

class FeedState {
  FeedState({
    required this.feeds,
    this.isLoading = true,
    this.errorMessage = "",
  });

  late bool isLoading;
  late String errorMessage;
  List<PixabayItem> feeds = [];

  FeedState copyWith({
    List<PixabayItem>? feeds,
    bool? isLoading = false,
    String? errorMessage,
  }) {
    return FeedState(
      feeds: feeds ?? this.feeds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
