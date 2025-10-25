import 'package:flutter/material.dart';
import 'package:camera_and_filter/widget/filter_carousel.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return PhotoFilterCarousel(imagePath: imagePath);
  }
}
