import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/size.dart';
import 'package:wzukowski_com/constants/works.dart';
import 'package:wzukowski_com/widgets/custom_text_field.dart';
import 'package:wzukowski_com/widgets/drawer_mobile.dart';
import 'package:wzukowski_com/widgets/header_desktop.dart';
import 'package:wzukowski_com/widgets/header_mobile.dart';
import 'package:wzukowski_com/widgets/separatorline.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
//https://pub.dev/packages/widget_and_text_animator

import 'package:wzukowski_com/widgets/sns.dart';

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
                height: constraints.maxHeight-60,
                width: double.maxFinite,
                color: CustomColor.yellowPrimary,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      right: 0,
                      child: EasyWebView(width: constraints.maxWidth/4, height: constraints.maxHeight/3.5, src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1591642207&color=%23353e77&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    ),
                    // Positioned(
                    //   top: 0,
                    //   left: 0,
                    //   child: EasyWebView(width: constraints.maxWidth/4, height: constraints.maxHeight/3.5, src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1453435387&color=%233c2d4f&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    // )
                  ],
                ),
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
                                  padding: const EdgeInsets.all(20),
                                  //color: Colors.green,
                                  width: constraints.maxWidth/2,
                                  child: Text(workTypes[i], style: const TextStyle(fontSize: 24),),
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
                                            Expanded( child: Text('${worksList[ii][0]} for ${worksList[ii][1]}', maxLines: 4, overflow: TextOverflow.ellipsis, textDirection: TextDirection.rtl, textAlign: TextAlign.left, style: const TextStyle(fontSize: 18),)),
                                            // ignore: unnecessary_null_comparison
                                            Container(padding: EdgeInsets.only(left: 20),child: Text(worksList[ii][2] == null ? "Empty" : '${worksList[ii][2]}', style: const TextStyle(fontSize: 18),)) //rok
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
              const Divider(thickness: 5),
               // ŻukowskiMularski
              Container(
                color: CustomColor.blackPrimary,
                width: double.maxFinite,
                child: Column(
                  children: [
                    const Text('MULARSKI/ZUKOWSKI', style: TextStyle(fontSize: 70),),
                    SizedBox(
                      height: 600,
                      width: constraints.maxWidth/1.25,
                      child: const EasyWebView(
                            src: 'https://www.youtube.com/embed/q0OqUIQzKWw?si=a6GWb6Tvdordoyw7',
                          ),
                    ),
                  ],
                )
              ),
              const Divider(thickness: 5),
              Container(
                color: CustomColor.blackPrimary,
                width: double.maxFinite,
                height: 800,
                child: Row(
                  children: [
                    Container(
                      width: constraints.maxWidth/2,
                      decoration: const BoxDecoration(
                       image: DecorationImage(image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth/2,
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 80),
                            child: Text('Get in Touch', style: const TextStyle(fontSize: 46)),
                          ),
                          Text('Name'),
                          CustomTextField(),
                          Text('Email'),
                          CustomTextField(),
                          Text('Message'),
                          CustomTextField(maxLines: 5),
                          SizedBox(width: 140, height: 45, child: ElevatedButton(onPressed: (){}, child: Text('send')))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // FOOTER
              Container(
                color: CustomColor.blackPrimary,
                height: 100,
                width: double.maxFinite,
                child: const Sns()
              )
            ],
          )
        );
      }
    );
  }
}