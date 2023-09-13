import 'package:flutter/material.dart';
import 'package:pixabay/constants/constants.dart';

class ClearSearchButton extends StatelessWidget {
  const ClearSearchButton({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: CircleAvatar(
        backgroundColor: darkGrey,
        radius: 8,
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
