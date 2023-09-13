import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay/constants/constants.dart';
import 'package:pixabay/constants/debouncer_util.dart';
import 'package:pixabay/screens/feed_screen/components/clear_search_button.dart';
import 'package:pixabay/screens/feed_screen/providers/feed_provider.dart';
import 'package:pixabay/widget_keys/widget_keys.dart';

class FeedSearchBar extends ConsumerStatefulWidget {
  const FeedSearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _FeedSearchBarState();
}

class _FeedSearchBarState extends ConsumerState<FeedSearchBar> {
  late TextEditingController _controller;
  final DebouncerUtil _debouncerUtil = DebouncerUtil();
  // Adjust the debounce duration as needed

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(feedProvider.notifier);

    return SizedBox(
      height: 38,
      child: TextFormField(
        key: WidgetKeys.searchBar,
        controller: _controller,
        cursorColor: orangeCursor,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: search,
          contentPadding: EdgeInsets.zero,
          fillColor: lightGrey,
          filled: true,
          border: searchInputBorder,
          enabledBorder: searchInputBorder,
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 20),
          suffixIconConstraints: const BoxConstraints(minHeight: 20),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ClearSearchButton(
              key: WidgetKeys.clearSearch,
              onTap: () {
                _controller.clear();
              },
            ),
          ),
        ),
        onChanged: (String value) async {
          //Retrieve images if search length is >= to 4
          if (value.length >= 4) {
            //wait until user is finished typing
            _debouncerUtil.run(() {
              provider.getImages(value);
            });
            // provider.getImages(value);
          }
        },
      ),
    );
  }
}
