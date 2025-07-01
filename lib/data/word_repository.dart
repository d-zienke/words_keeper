import '../models/word.dart';

class WordRepository {
  // Na start prosta lista w pamięci (baza do rozbudowy)
  final List<Word> _words = [];

  List<Word> getAll() => List.unmodifiable(_words);

  void add(Word word) {
    _words.add(word);
  }

  void update(Word word) {
    int index = _words.indexWhere((w) => w.id == word.id);
    if (index != -1) {
      _words[index] = word;
    }
  }

  void remove(String id) {
    _words.removeWhere((w) => w.id == id);
  }

  Word? getById(String id) {
    try {
      return _words.firstWhere((w) => w.id == id);
    } catch (e) {
      return null;
    }
  }
}
