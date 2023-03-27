import 'package:flutter/material.dart';

class ColouredPokeball extends StatelessWidget {
  const ColouredPokeball({
    super.key,
    required this.color,
    required this.width,
    required this.opacity,
  });
  final Color color;
  final double width;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColorFiltered(
        colorFilter:
            ColorFilter.mode(color.withOpacity(opacity), BlendMode.modulate),
        child: Image.asset(
          'images/pokeball.png',
          width: 20,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
