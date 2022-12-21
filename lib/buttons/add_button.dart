import 'package:flutter/material.dart';

enum ButtonType {
  text,
  outlined;
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonType = ButtonType.text,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.text:
        return TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              const Icon(Icons.add),
              const SizedBox(width: 6),
              Text(text),
            ],
          ),
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onTap,
          child: Row(
            children: [
              const Icon(Icons.add),
              const SizedBox(width: 6),
              Text(text),
            ],
          ),
        );
    }
  }
}
