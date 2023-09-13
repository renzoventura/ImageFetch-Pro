import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay/screens/feed_screen/components/feed_item_widget.dart';
import 'package:pixabay/screens/feed_screen/components/loading_indicator.dart';
import 'package:pixabay/screens/feed_screen/providers/feed_provider.dart';
import 'package:pixabay/widget_keys/widget_keys.dart';

class FeedContainer extends ConsumerStatefulWidget {
  const FeedContainer({super.key});

  @override
  ConsumerState createState() => _FeedContainerState();
}

class _FeedContainerState extends ConsumerState<FeedContainer> {
  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedProvider);

    return feedState.isLoading
        ? const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: LoadingIndicator(),
            ),
          )
        : feedState.feeds.isEmpty && feedState.errorMessage.isNotEmpty
            ? Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Text(feedState.errorMessage),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 16,
                  right: 10,
                ),
                child: Scrollbar(
                  trackVisibility: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: feedState.feeds.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FeedItemWidget(
                          feedState.feeds[index],
                          key: WidgetKeys.pixabayItem,
                        ),
                      );
                    },
                  ),
                ),
              );
  }
}
