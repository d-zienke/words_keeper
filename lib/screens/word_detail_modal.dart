import 'package:flutter/material.dart';
import '../models/word.dart';
import '../models/language.dart';
import '../widgets/flag_icon.dart';
import '../widgets/revealable_text.dart';
import 'word_form_screen.dart';

class WordDetailModal extends StatelessWidget {
  final Word word;
  final Language baseLanguage;
  final VoidCallback? onEdit;

  const WordDetailModal({
    required this.word,
    required this.baseLanguage,
    this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Przygotuj słowa i flagi według wybranego języka
    String? pl = word.pl;
    String? en = word.en;
    String? es = word.es;

    // Ustal, które tłumaczenia będą "ukryte"
    List<_TranslationRow> rows = [];
    if (baseLanguage.code == 'pl') {
      rows = [
        _TranslationRow(label: 'Polski', value: pl, flag: 'pl', hidden: false),
        _TranslationRow(label: 'English', value: en, flag: 'gb', hidden: true),
        _TranslationRow(label: 'Español', value: es, flag: 'es', hidden: true),
      ];
    } else if (baseLanguage.code == 'gb') {
      rows = [
        _TranslationRow(label: 'English', value: en, flag: 'gb', hidden: false),
        _TranslationRow(label: 'Polski', value: pl, flag: 'pl', hidden: true),
        _TranslationRow(label: 'Español', value: es, flag: 'es', hidden: true),
      ];
    } else if (baseLanguage.code == 'es') {
      rows = [
        _TranslationRow(label: 'Español', value: es, flag: 'es', hidden: false),
        _TranslationRow(label: 'Polski', value: pl, flag: 'pl', hidden: true),
        _TranslationRow(label: 'English', value: en, flag: 'gb', hidden: true),
      ];
    }

    return Center(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black26)],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rows.map((row) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      FlagIcon(countryCode: row.flag, size: 32),
                      const SizedBox(width: 16),
                      if (!row.hidden)
                        Text(
                          row.value ?? '---',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        Expanded(
                          child: RevealableText(
                            text: row.value ?? '---',
                            fontSize: 24,
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
            // Ikonka edycji w prawym dolnym rogu
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                mini: true,
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordFormScreen(
                        baseLanguage: baseLanguage,
                        wordToEdit: word,
                      ),
                    ),
                  );
                  if (onEdit != null) onEdit!();
                },
                tooltip: 'Edit',
                child: const Icon(Icons.edit),
              ),
            ),
            // Ikonka zamknięcia w prawym górnym rogu
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pomocnicza klasa do wygodniejszego przekazywania danych do widgetów
class _TranslationRow {
  final String label;
  final String? value;
  final String flag;
  final bool hidden;
  _TranslationRow({
    required this.label,
    this.value,
    required this.flag,
    this.hidden = true,
  });
}
