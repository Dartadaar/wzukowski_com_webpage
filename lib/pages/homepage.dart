import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/size.dart';
import 'package:wzukowski_com/constants/works.dart';
import 'package:wzukowski_com/widgets/drawer_mobile.dart';
import 'package:wzukowski_com/widgets/header_desktop.dart';
import 'package:wzukowski_com/widgets/header_mobile.dart';

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
          backgroundColor: Colors.transparent,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth ? null: const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //IFMOBILE
              // MAIN
              //if(constraints.maxWidth >= kMinDesktopWidth)
              //const HeaderDesktop() else
              //HeaderMobile(
              //  onLogoTap: (){},
              //  onMenuTap: (){
              //    scaffoldKey.currentState?.openEndDrawer();
              //  },
              //),
              //SCROLLING BACKGROUND
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover,
                  )
                ),
                height: constraints.maxHeight,
                width: double.maxFinite,
                child: Column(
                  children: [
                    constraints.maxWidth >= kMinDesktopWidth ? const HeaderDesktop(): HeaderMobile(
                    onLogoTap: (){},
                    onMenuTap: (){
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                    ),
                    const Text("live visual artist | improviser | composer"),
                  ],
                ),
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
                padding: EdgeInsets.all(30),
                color: CustomColor.blackPrimary,
                child: 
                Column(
                  children: [
                    for(int i=0; i<workTypes.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(color: Colors.green, child: Text(workTypes[i]),)]),
                        Spacer(),
                        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Row(children: [Text('utwór'), Text('rok')])])
                      ],
                    ),
                    Divider(),
                  ],
                )
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