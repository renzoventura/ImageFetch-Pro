import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixabay/constants/constants.dart';
import 'package:pixabay/screens/feed_screen/components/search_bar.dart';

import '../components/feed_container.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 45,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(pixabayTitle, style: logoTextStyle),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: FeedSearchBar(),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: const FeedContainer(),
            ),
          ),
        ],
      ),
    );
  }
}
