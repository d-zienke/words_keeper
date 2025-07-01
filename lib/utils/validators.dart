class WordValidators {
  static String? validateWords({String? pl, String? en, String? es}) {
    // Przynajmniej dwa pola muszą być wypełnione
    int filled = [
      pl,
      en,
      es,
    ].where((t) => t != null && t.trim().isNotEmpty).length;
    if (filled < 2) {
      return 'Wypełnij przynajmniej dwa pola';
    }
    return null;
  }
}
