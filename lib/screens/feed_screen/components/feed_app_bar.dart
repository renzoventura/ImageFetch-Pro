import 'package:flutter/material.dart';
import 'package:pixabay/constants/constants.dart';

class FeedAppBar extends StatelessWidget {
  const FeedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        pixabayTitle,
        style: logoTextStyle,
      ),
    );
  }
}
