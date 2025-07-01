import 'package:flutter/material.dart';

class WordFormScreen extends StatelessWidget {
  final String? wordId; // null dla nowego słówka, id dla edycji

  const WordFormScreen({this.wordId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wordId == null ? 'Dodaj słówko' : 'Edytuj słówko'),
      ),
      body: const Center(child: Text('Formularz dodawania/edycji słówka.')),
    );
  }
}
