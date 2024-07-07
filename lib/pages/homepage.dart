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
                padding: EdgeInsets.all(20),
                color: CustomColor.blackPrimary,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for(int i=0;i<work_types.length;i++)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [Text(work_types[i])],),
                            //Spacer(),
                            Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: [
                              for (int ii=0;ii<works_list.length;ii++)
                              if (works_list[ii][3]==i) Text(works_list[ii][0] as String)
                            ],)
                          ]
                        )
                      ],
                    ),
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