import 'package:flutter/material.dart';

class ProductImageHero extends StatelessWidget {
  final String imagePath;

  const ProductImageHero({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imagePath,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}