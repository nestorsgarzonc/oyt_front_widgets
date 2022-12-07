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
    final controller = TextEditingController(text: '632f14f6861d4e5ee23f77b2');

    return showModalBottomSheet(
      isScrollControlled: true,
      shape: BottomSheetConstants.shape,
      context: context,
      builder: (context) {
        return BaseBottomSheet(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ingresa el codigo de tu mesa',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
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
              ElevatedButton(
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
