import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/nav_items.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blackPrimary,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // MAIN
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20.0,),
            width: double.maxFinite,
            child: Row(
              children: [
                for (int i = 0; i < navTitles.length; i++)
                  Padding(padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(navTitles[i], style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whitePrimary
                      ),),
                    ),
                  ),

                Spacer(),

                Text("Włodzimierz Żukowski", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  color: CustomColor.whitePrimary
                ),)

                //dodać social networks
              ],
            ),
          ),
          //SCROLLING BACKGROUND
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20.0,),
            width: double.maxFinite,
          ),
          // SELECTED WORKS
          Container(
            height: 500,
            width: double.maxFinite,
            color: CustomColor.yellowPrimary,
          ),
          // LIST OF WORKS
          Container(
            height: 500,
            width: double.maxFinite,
          ),
           // ŻukowskiMularski
          Container(
            height: 500,
            width: double.maxFinite,
          ),
          // installation
          Container(
            height: 500,
            width: double.maxFinite,
          ),
          // CONTACT
          Container(
            height: 500,
            width: double.maxFinite,
          ),
          // FOOTER
          Container(
            height: 500,
            width: double.maxFinite,
          )
        ],
      )
    );
  }
}