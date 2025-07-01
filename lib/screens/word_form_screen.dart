import 'package:flutter/material.dart';
import '../models/language.dart';
import '../models/word.dart';
import '../widgets/flag_icon.dart';
import '../data/word_repository.dart';
import '../utils/validators.dart';

class WordFormScreen extends StatefulWidget {
  final Language baseLanguage;
  final Word? wordToEdit;

  const WordFormScreen({
    required this.baseLanguage,
    this.wordToEdit,
    super.key,
  });

  @override
  State<WordFormScreen> createState() => _WordFormScreenState();
}

class _WordFormScreenState extends State<WordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _plController = TextEditingController();
  final _enController = TextEditingController();
  final _esController = TextEditingController();

  String? _formError;

  @override
  void initState() {
    super.initState();
    if (widget.wordToEdit != null) {
      _plController.text = widget.wordToEdit!.pl ?? '';
      _enController.text = widget.wordToEdit!.en ?? '';
      _esController.text = widget.wordToEdit!.es ?? '';
    }
  }

  @override
  void dispose() {
    _plController.dispose();
    _enController.dispose();
    _esController.dispose();
    super.dispose();
  }

  void _save() {
    final error = WordValidators.validateWords(
      pl: _plController.text,
      en: _enController.text,
      es: _esController.text,
    );
    if (error != null) {
      setState(() {
        _formError = error;
      });
      return;
    }

    final repo = WordRepository();

    if (widget.wordToEdit != null) {
      // Edycja
      final updated = Word(
        id: widget.wordToEdit!.id,
        pl: _plController.text.trim(),
        en: _enController.text.trim(),
        es: _esController.text.trim(),
      );
      repo.update(updated);
    } else {
      // Dodawanie nowego słówka
      final newWord = Word(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        pl: _plController.text.trim(),
        en: _enController.text.trim(),
        es: _esController.text.trim(),
      );
      repo.add(newWord);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.wordToEdit == null ? 'Dodaj słówko' : 'Edytuj słówko',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    _formError!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              _WordInputRow(
                controller: _plController,
                label: 'Polski',
                flag: 'pl',
                hint: 'Wpisz po polsku',
              ),
              const SizedBox(height: 16),
              _WordInputRow(
                controller: _enController,
                label: 'English',
                flag: 'gb',
                hint: 'Enter in English',
              ),
              const SizedBox(height: 16),
              _WordInputRow(
                controller: _esController,
                label: 'Español',
                flag: 'es',
                hint: 'Introduce en español',
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Zapisz'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WordInputRow extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String flag;
  final String hint;

  const _WordInputRow({
    required this.controller,
    required this.label,
    required this.flag,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlagIcon(countryCode: flag, size: 32),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
