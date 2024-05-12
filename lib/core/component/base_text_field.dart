// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.controller,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.padding,
    this.onChanged,
    this.inputFormatters,
    this.autofocus = false,
  });
  final TextEditingController? controller;
  final String? hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: TextFormField(
        key: key,
        controller: controller,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        validator: validator,
        autofocus: autofocus,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 16),
        onChanged: onChanged,
        decoration: _buildDecoration(context),
      ),
    );
  }

  InputDecoration _buildDecoration(BuildContext context) => InputDecoration(
        fillColor: const Color(0xfff4f4f4),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        border: _buildBorder(context),
        enabledBorder: _buildBorder(context),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xffBABABA)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );

  OutlineInputBorder _buildBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      );
}
