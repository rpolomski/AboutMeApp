import 'package:flutter/material.dart';

class TripListview extends StatelessWidget {
  final List<ImageProvider> images;
  final String text;
  final String place;

  const TripListview({
    Key? key,
    required this.images,
    required this.text, required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          place,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images
                .map((image) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(image: image, width: 200, height: 200),
                    ))
                .toList(),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
