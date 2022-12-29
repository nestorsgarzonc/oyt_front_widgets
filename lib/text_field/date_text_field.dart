import 'package:flutter/material.dart';
import 'package:oyt_front_widgets/widgets/custom_text_field.dart';

class DateTextField extends StatelessWidget {
  DateTextField({
    super.key,
    required this.label,
    required this.onTap,
  });

  final controller = TextEditingController();
  final String label;
  final void Function(DateTime time) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022, 12),
          lastDate: DateTime.now(),
        );
        if (res == null) return;
        onTap(res);
        controller.text = '${res.day}/${res.month}/${res.year}';
      },
      child: AbsorbPointer(
        child: CustomTextField(label: label, controller: controller),
      ),
    );
  }
}
