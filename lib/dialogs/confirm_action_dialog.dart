import 'package:flutter/material.dart';

class ConfirmActionDialog extends StatelessWidget {
  const ConfirmActionDialog({
    super.key,
    required this.onConfirm,
    this.onCancel,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String title;
  final String subtitle;

  static Future<void> show({
    required BuildContext context,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    required String title,
    String subtitle = 'Esta acción no se puede deshacer',
  }) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmActionDialog(
        onConfirm: onConfirm,
        onCancel: onCancel,
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(onPressed: Navigator.of(context).pop, icon: const Icon(Icons.close)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onCancel ?? Navigator.of(context).pop,
          child: const Text('Cancelar'),
        ),
        TextButton(onPressed: onConfirm, child: const Text('Confirmar')),
      ],
      content: Text(subtitle, style: const TextStyle(fontSize: 14)),
    );
  }
}
