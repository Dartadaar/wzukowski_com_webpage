import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/size.dart';
import 'package:wzukowski_com/constants/works.dart';
import 'package:wzukowski_com/widgets/drawer_mobile.dart';
import 'package:wzukowski_com/widgets/header_desktop.dart';
import 'package:wzukowski_com/widgets/header_mobile.dart';
import 'package:wzukowski_com/widgets/separatorline.dart';

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
          backgroundColor: Colors.black,
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
              //uwaga z paddingami oblicza polowe ekranu
              Container(
                width: double.maxFinite,
                color: CustomColor.blackPrimary,
                child: 
                Column(
                  children: [
                    for(int i=0; i<workTypes.length; i++) //pętla rodzajów
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.green,
                                  width: constraints.maxWidth/2,
                                  child: Text(workTypes[i]),
                                )
                              ]
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end, children:[
                                for (int ii=0;ii<worksList.length;ii++)
                                if (worksList[ii][3]==i)
                                Container(
                                  width: constraints.maxWidth/2,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 20, bottom: 40),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded( child: Text('${worksList[ii][0]} for ${worksList[ii][1]}', maxLines: 4, overflow: TextOverflow.ellipsis, textDirection: TextDirection.rtl, textAlign: TextAlign.left)),
                                            // ignore: unnecessary_null_comparison
                                            Container(padding: EdgeInsets.only(left: 20),child: Text(worksList[ii][2] == null ? "Empty" : '${worksList[ii][2]}'))
                                          ]
                                         ),
                                      ),
                                       Divider(color: CustomColor.whitePrimary, height: 0,)
                                    ],
                                  ),
                                )
                                ]
                            ),
                          ]
                        ),
                        if (i<workTypes.length-1)
                        SeparatorLine()
                      ],
                    ),
                  ],
                )
              ),
              Divider(thickness: 5),
               // ŻukowskiMularski
              Container(
                color: CustomColor.blackPrimary,
                height: 500,
                width: double.maxFinite,
                child: EasyWebView(
                      src: 'https://www.youtube.com/embed/q0OqUIQzKWw?si=a6GWb6Tvdordoyw7',
                      width: constraints.maxWidth/3,
                    )
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