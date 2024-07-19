import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key,this.onTap,});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: onTap,
                  child: const Text("Włodzimierz Żukowski", style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.whitePrimary
                  ),),
                );
  }
}