import '../models/word.dart';

class WordRepository {
  static final WordRepository _instance = WordRepository._internal();

  factory WordRepository() => _instance;

  WordRepository._internal();

  final List<Word> _words = [
    Word(id: '1', pl: 'kot', en: 'cat', es: 'gato'),
    Word(id: '2', pl: 'pies', en: 'dog', es: 'perro'),
    Word(id: '3', pl: 'dom', en: 'house', es: 'casa'),
    Word(id: '4', pl: 'woda', en: 'water', es: 'agua'),
    Word(id: '5', pl: 'dzień', en: 'day', es: 'día'),
  ];

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
