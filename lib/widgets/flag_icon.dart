import 'package:flutter/material.dart';

class FlagIcon extends StatelessWidget {
  final String countryCode; // 'pl', 'en', 'es'
  final double size;

  const FlagIcon({required this.countryCode, this.size = 24, super.key});

  @override
  Widget build(BuildContext context) {
    String assetPath = 'assets/flags/$countryCode.png';

    return Image.asset(
      assetPath,
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) {
        // Jeśli nie ma obrazka, wyświetl kod kraju jako tekst
        return Text(
          countryCode.toUpperCase(),
          style: TextStyle(fontSize: size * 0.8),
        );
      },
    );
  }
}
