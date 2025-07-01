import 'package:flutter/material.dart';
import '../models/word.dart';
import '../models/language.dart';

class WordTile extends StatelessWidget {
  final Word word;
  final Language baseLanguage;

  const WordTile({required this.word, required this.baseLanguage, super.key});

  @override
  Widget build(BuildContext context) {
    // Wybieramy słówko w języku podstawowym
    String mainText = '';
    String? en = word.en;
    String? pl = word.pl;
    String? es = word.es;
    String subtitle = '';

    switch (baseLanguage.code) {
      case 'pl':
        mainText = pl ?? '';
        subtitle = '${en ?? ''}  |  ${es ?? ''}';
        break;
      case 'gb':
        mainText = en ?? '';
        subtitle = '${pl ?? ''}  |  ${es ?? ''}';
        break;
      case 'es':
        mainText = es ?? '';
        subtitle = '${pl ?? ''}  |  ${en ?? ''}';
        break;
    }

    return ListTile(
      title: Text(
        mainText,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(subtitle),
      onTap: () {
        // Tu potem otworzymy szczegóły słówka
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.teal.shade100),
      ),
      tileColor: Colors.white,
      minVerticalPadding: 12,
    );
  }
}
