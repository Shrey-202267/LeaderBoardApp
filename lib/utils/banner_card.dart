import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String ImagePath;
  const BannerCard({super.key, required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(ImagePath, fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
