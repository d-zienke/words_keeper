import 'package:flutter/material.dart';

class RevealableText extends StatefulWidget {
  final String text;

  const RevealableText({required this.text, super.key});

  @override
  State<RevealableText> createState() => _RevealableTextState();
}

class _RevealableTextState extends State<RevealableText> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _revealed
            ? Text(widget.text, style: const TextStyle(fontSize: 20))
            : const Text('•••••', style: TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(_revealed ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _revealed = !_revealed),
        ),
      ],
    );
  }
}
