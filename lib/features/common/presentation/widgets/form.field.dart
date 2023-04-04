import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String placeholder;
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool autofocus;
  final TextInputType? inputType;
  final TextCapitalization capitalization;

  const AppFormField({
    super.key,
    required this.placeholder,
    this.validator,
    this.controller,
    this.onTap,
    this.autofocus = false,
    this.inputType,
    this.capitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        validator: validator,
        autofocus: autofocus,
        keyboardType: inputType,
        textCapitalization: capitalization,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
          hintText: placeholder,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        onTap: onTap,
        readOnly: onTap != null,
      );
}
