import 'package:flutter/material.dart';
import 'package:pixabay/constants/constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(color: darkGrey),
        ),
        const SizedBox(width: 16),
        Text(loading),
      ],
    );
  }
}
