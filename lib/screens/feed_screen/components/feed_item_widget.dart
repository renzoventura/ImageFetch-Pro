import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay/models/pixabay_item.dart';

class FeedItemWidget extends StatelessWidget {
  final PixabayItem imageItem;
  const FeedItemWidget(this.imageItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 350,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: imageItem.largeImageURL ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: 'By ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: '${imageItem.user}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Text(imageItem.tags ?? ''),
        const SizedBox(height: 20),
      ],
    );
  }
}
