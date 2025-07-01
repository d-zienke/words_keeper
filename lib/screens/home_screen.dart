import 'package:flutter/material.dart';
import '../models/language.dart';

class HomeScreen extends StatelessWidget {
  final Language baseLanguage;

  const HomeScreen({required this.baseLanguage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Słówka (${baseLanguage.name})')),
      body: Center(
        child: Text(
          'Tutaj będzie lista słówek dla: ${baseLanguage.name}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
