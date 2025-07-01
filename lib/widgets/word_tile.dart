import 'package:flutter/material.dart';

class WordTile extends StatelessWidget {
  final String wordId;

  const WordTile({required this.wordId, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Słówko $wordId'),
      subtitle: const Text('Tutaj pojawią się tłumaczenia'),
      onTap: () {
        // Po kliknięciu otworzy się modal szczegółów
      },
    );
  }
}
