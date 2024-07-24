import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.controller, this.maxLines = 1, this.hintText});
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.blackPrimary),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whitePrimary,
          //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColor.whitePrimary, strokeAlign: BorderSide.strokeAlignOutside),)
          hintText: hintText,
          hintStyle: const TextStyle(color: CustomColor.whiteSecondary)),
    );
  }
}
