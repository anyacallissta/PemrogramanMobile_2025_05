import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera_and_filter/widget/filter_selector.dart';

class PhotoFilterCarousel extends StatefulWidget {
  final String imagePath;
  const PhotoFilterCarousel({super.key, required this.imagePath});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ValueListenableBuilder(
              valueListenable: _filterColor,
              builder: (context, color, child) {
                return Image.file(
                  File(widget.imagePath),
                  color: color.withOpacity(0.5),
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: FilterSelector(
              filters: _filters,
              onFilterChanged: _onFilterChanged,
            ),
          ),
        ],
      ),
    );
  }
}