import 'package:flutter/material.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wybierz język podstawowy')),
      body: const Center(
        child: Text('Tutaj będzie swipe po flagach i wybór języka.'),
      ),
    );
  }
}
