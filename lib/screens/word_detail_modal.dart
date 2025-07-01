import 'package:flutter/material.dart';

class WordDetailModal extends StatelessWidget {
  final String wordId;

  const WordDetailModal({required this.wordId, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
        ),
        child: const Center(child: Text('Szczegóły słówka (modal).')),
      ),
    );
  }
}
