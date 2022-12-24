import 'package:flutter/material.dart';
import 'package:oyt_front_widgets/widgets/custom_text_field.dart';

class TimeTextField extends StatelessWidget {
  TimeTextField({
    super.key,
    required this.label,
    required this.onTap,
  });

  final controller = TextEditingController();
  final String label;
  final void Function(TimeOfDay time) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 8, minute: 0),
        );
        if (res == null) return;
        onTap(res);
        controller.text = '${res.hour}:${res.minute < 10 ? '0${res.minute}' : res.minute}';
      },
      child: AbsorbPointer(
        child: CustomTextField(label: label, controller: controller),
      ),
    );
  }
}
