// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieledGame extends StatelessWidget {
  TextFieledGame({
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
    this.onChanged,
    super.key,
  });

  TextEditingController? controller;
  final Widget? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: h * 0.018, horizontal: 15), // Установка отступов
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8E86A6), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: const Color(0xff8E86A6),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: h * 0.02, // Размер текста для подписи
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
