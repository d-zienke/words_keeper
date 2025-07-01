# Words Keeper

**Words Keeper** is a modular Flutter app for learning and organizing vocabulary in multiple languages.  
Designed for quick entry, flexible browsing, and future expansion (flashcards, API, database, etc.).

---

## ✨ Features

- **Multi-language word entries:** Polish, English, Spanish (more can be added easily)
- **Language selection:** Swipe to pick your base language on start
- **Word browsing:** See your words in a clean, single-column list
- **Custom flag icons:** Each language field has its flag (with fallback)
- **Modular code:** Easy to extend and maintain (separate folders for widgets, models, screens, etc.)
- **Ready for future features:** Editing, hiding/showing translations, advanced learning modes

---

## 🚀 Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/words_keeper.git
   cd words_keeper
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app on your device or emulator:**

   ```bash
   flutter run
   ```

4. **Make sure you have the flag images in:**

   ```txt
   assets/flags/pl.png
   assets/flags/gb.png
   assets/flags/es.png
   ```

   *(If you want to use your own flag icons, place them in this folder and update `pubspec.yaml`.)*

---

## 📂 Project Structure

```txt
lib/
├── app.dart              # App config, theme, routing
├── main.dart             # Entry point
├── models/               # Data models (Word, Language)
├── data/                 # Repository for words (for now, in-memory)
├── screens/              # Screens: language selection, home, word detail, form
├── widgets/              # Reusable UI components (WordTile, FlagIcon, etc.)
├── utils/                # Helpers and validators
assets/
└── flags/                # PNG flag images for each language
```

---

## 📝 Roadmap

- [x] Language selection with flag swipe
- [x] List view by chosen base language
- [ ] Add/Edit/Delete words via form
- [ ] Word details modal with hidden/reveal translations
- [ ] Local persistent storage (SQLite)
- [ ] Flashcard & spaced repetition system
- [ ] API sync / cloud backup
- [ ] Export/Import word lists

---

## 🤝 Contributing

PRs and issues welcome!
Have an idea? [Open an issue](https://github.com/d-zienke/words_keeper/issues) or fork the project and make a pull request.

---

## 🛠️ Tech Stack

- **Flutter** (cross-platform mobile)
- **Dart** (language)
- **Material Design**

---

## 📄 License

[MIT](LICENSE) — free to use, fork, and modify.

---

*Made with 💚 by [Damian](https://www.linkedin.com/in/damian-zienke/) & [ByteSprout](https://chatgpt.com/g/g-685c24daf69481919cc76d7664cac5c9-bytesprout)*
