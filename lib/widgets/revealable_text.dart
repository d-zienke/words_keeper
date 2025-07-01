import 'package:flutter/material.dart';

class RevealableText extends StatefulWidget {
  final String text;
  final double fontSize;

  const RevealableText({required this.text, this.fontSize = 20, super.key});

  @override
  State<RevealableText> createState() => _RevealableTextState();
}

class _RevealableTextState extends State<RevealableText> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _revealed
              ? Text(widget.text, style: TextStyle(fontSize: widget.fontSize))
              : Text(
                  '•••••',
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.teal,
                  ),
                ),
        ),
        IconButton(
          icon: Icon(_revealed ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _revealed = !_revealed),
        ),
      ],
    );
  }
}
