import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.maxLine=1, this.hintText});
  final TextEditingController? controller;
  final maxLine;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return const TextField(
                            style: TextStyle(color: CustomColor.blackPrimary),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              filled: true,
                              fillColor: CustomColor.whitePrimary,
                              //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColor.whitePrimary, strokeAlign: BorderSide.strokeAlignOutside),)
                              hintText: 'Name',
                              hintStyle: TextStyle(color: CustomColor.whiteSecondary)
                            ),
                          );
  }
}