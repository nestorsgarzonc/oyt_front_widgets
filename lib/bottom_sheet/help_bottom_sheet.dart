import 'package:flutter/material.dart';
import 'package:oyt_front_widgets/bottom_sheet/base_bottom_sheet.dart';
import 'package:oyt_front_widgets/bottom_sheet/bottom_sheet_constants.dart';

class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({super.key, required this.text, required this.title});
  final String text;
  final String title;

  static Future<void> show(BuildContext context, String text, String title) {
    return showModalBottomSheet(
      context: context,
      shape: BottomSheetConstants.shape,
      builder: (context) => HelpBottomSheet(text: text, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: Navigator.of(context).pop, icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 10),
          Text(text, textAlign: TextAlign.start),
          SizedBox(height: 30 + MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
