import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/size.dart';
import 'package:wzukowski_com/widgets/drawer_mobile.dart';
import 'package:wzukowski_com/widgets/header_desktop.dart';
import 'package:wzukowski_com/constants/nav_items.dart';
import 'package:wzukowski_com/widgets/header_mobile.dart';
import 'package:wzukowski_com/widgets/site_logo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.blackPrimary,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth ? null: const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // MAIN
              if(constraints.maxWidth >= kMinDesktopWidth)
              const HeaderDesktop() else
              HeaderMobile(
                onLogoTap: (){},
                onMenuTap: (){
                  scaffoldKey.currentState?.openEndDrawer();
                },
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
    );
  }
}