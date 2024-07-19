import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/nav_items.dart';
import 'package:wzukowski_com/widgets/site_logo.dart';
import 'package:wzukowski_com/widgets/sns.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            width: double.maxFinite,
            child: Row(
              children: [
                for (int i = 0; i < navTitles.length; i++)
                  Padding(padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {
                        onNavMenuTap(i);
                      },
                      child: Text(navTitles[i], style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whitePrimary
                      ),),
                    ),
                  ),
                
                const Spacer(),

                SiteLogo(
                  onTap: (){},
                ),

                const Spacer(),

                const Sns()
              ],
            ),
          );
  }
}