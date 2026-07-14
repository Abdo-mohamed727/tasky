import 'package:flutter/material.dart';

class CoustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData suffixIcon;
  final VoidCallback? onSuffixIconTap;

  const CoustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.obscureText,
    required this.suffixIcon,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 14),
        suffixIcon: onSuffixIconTap != null
            ? IconButton(
                icon: Icon(suffixIcon, color: const Color(0xFFAAAAAA)),
                onPressed: onSuffixIconTap,
              )
            : Icon(suffixIcon, color: const Color(0xFFAAAAAA)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF5C35E8), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}