import 'package:flutter/material.dart';
import 'screens/language_select.dart';

class WordsKeeperApp extends StatelessWidget {
  const WordsKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Words Keeper',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const LanguageSelectScreen(),
    );
  }
}
