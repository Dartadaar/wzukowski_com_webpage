import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: CustomColor.whitePrimary,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close)),
              ),
            ),
            for(int i=0;i<navTitles.length;i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              titleTextStyle: const TextStyle(
                color: CustomColor.blackPrimary,
                fontSize: 20,
              ),
              onTap: (){},
              title:Text(navTitles[i])
            )
          ],
        ),
      );
  }
}