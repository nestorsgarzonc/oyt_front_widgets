import 'package:flutter/material.dart';
import 'package:oyt_front_core/validators/text_form_validator.dart';
import 'package:oyt_front_widgets/bottom_sheet/base_bottom_sheet.dart';
import 'package:oyt_front_widgets/bottom_sheet/bottom_sheet_constants.dart';
import 'package:oyt_front_widgets/widgets/custom_text_field.dart';

class TableCodeBottomSheet {
  static Future<void> showManualCodeSheet({
    required BuildContext context,
    required void Function(String) onAccept,
  }) {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController(text: '63c707905e93bee4a4782d0e');

    return showModalBottomSheet(
      isScrollControlled: true,
      shape: BottomSheetConstants.shape,
      context: context,
      builder: (context) {
        return BaseBottomSheet(
          title: 'Ingresa el codigo de tu mesa',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: CustomTextField(
                  label: 'Codigo de la mesa',
                  controller: controller,
                  validator: TextFormValidator.tableCodeValidator,
                ),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onAccept(controller.text);
                  }
                },
                child: const Text('Continuar'),
              ),
              SizedBox(height: 10 + MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        );
      },
    );
  }
}
