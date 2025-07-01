import 'package:flutter/material.dart';
import '../models/language.dart';
import '../widgets/flag_icon.dart';
import 'home_screen.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  // Lista obsługiwanych języków — można rozszerzać!
  final List<Language> languages = const [
    Language(code: 'pl', name: 'Polski', asset: 'assets/flags/pl.png'),
    Language(code: 'gb', name: 'English (UK)', asset: 'assets/flags/gb.png'),
    Language(
      code: 'es',
      name: 'Español (España)',
      asset: 'assets/flags/es.png',
    ),
  ];

  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: 0.6,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onChoose() {
    // W przyszłości tu można zapisywać do pamięci.
    final selectedLanguage = languages[selectedIndex];

    // Przechodzimy do HomeScreen, przekazując wybrany język (póki co nie używamy parametru)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(baseLanguage: selectedLanguage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wybierz język podstawowy')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _pageController,
              itemCount: languages.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final lang = languages[index];
                final bool isSelected = index == selectedIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(
                    horizontal: isSelected ? 12 : 24,
                    vertical: isSelected ? 0 : 24,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.teal.shade50
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: isSelected
                        ? Border.all(color: Colors.teal, width: 2)
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlagIcon(
                        countryCode: lang.code,
                        size: isSelected ? 80 : 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        lang.name,
                        style: TextStyle(
                          fontSize: isSelected ? 22 : 16,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _onChoose,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text('Wybierz'),
          ),
        ],
      ),
    );
  }
}
