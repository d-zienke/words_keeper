import 'package:flutter/material.dart';
import '../models/language.dart';
import '../data/word_repository.dart';
import '../models/word.dart';
import '../widgets/word_tile.dart';
import 'word_form_screen.dart';

class HomeScreen extends StatefulWidget {
  final Language baseLanguage;
  const HomeScreen({required this.baseLanguage, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repo = WordRepository();

  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final List<Word> words = repo.getAll();

    return Scaffold(
      appBar: AppBar(title: Text('Słówka (${widget.baseLanguage.name})')),
      body: words.isEmpty
          ? const Center(child: Text('Brak słówek.'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                // Pokazujemy tylko słówka, które mają podane tłumaczenie w wybranym języku
                String? mainText;
                switch (widget.baseLanguage.code) {
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

                return WordTile(
                  word: word,
                  baseLanguage: widget.baseLanguage,
                  onChanged: _refresh,
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 6),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  WordFormScreen(baseLanguage: widget.baseLanguage),
            ),
          );
          _refresh();
        },
        tooltip: "Dodaj słówko",
        child: const Icon(Icons.add),
      ),
    );
  }
}
