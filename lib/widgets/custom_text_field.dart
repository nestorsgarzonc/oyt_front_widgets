import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    this.autofocus = false,
    this.obscureText = false,
    this.validator,
    this.decoration,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.hintText,
    super.key,
    this.prefixIcon,
    this.contentPadding,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autofocus;
  final int maxLines;
  final int? minLines;
  final String label;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      decoration: decoration ??
          InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            prefixIcon: prefixIcon,
            hintText: hintText,
            contentPadding: contentPadding,
          ),
    );
  }
}
