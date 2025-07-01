import 'package:flutter/material.dart';
import '../models/language.dart';
import '../data/word_repository.dart';
import '../models/word.dart';
import '../widgets/word_tile.dart';

class HomeScreen extends StatelessWidget {
  final Language baseLanguage;
  final WordRepository repository = WordRepository(); // Na razie lokalnie

  HomeScreen({required this.baseLanguage, super.key});

  @override
  Widget build(BuildContext context) {
    // Pobieramy listę słówek
    final List<Word> words = repository.getAll();

    return Scaffold(
      appBar: AppBar(title: Text('Słówka (${baseLanguage.name})')),
      body: words.isEmpty
          ? const Center(child: Text('Brak słówek.'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                // Pokazujemy tylko słówka, które mają podane tłumaczenie w wybranym języku
                String? mainText;
                switch (baseLanguage.code) {
                  case 'pl':
                    mainText = word.pl;
                    break;
                  case 'gb':
                    mainText = word.en;
                    break;
                  case 'es':
                    mainText = word.es;
                    break;
                }
                if (mainText == null || mainText.isEmpty) {
                  return const SizedBox.shrink();
                }

                return WordTile(word: word, baseLanguage: baseLanguage);
              },
              separatorBuilder: (context, index) => const Divider(height: 6),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tu później formularz dodawania słówka
        },
        tooltip: "Dodaj słówko",
        child: const Icon(Icons.add),
      ),
    );
  }
}
