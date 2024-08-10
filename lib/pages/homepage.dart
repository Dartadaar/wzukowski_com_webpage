import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:wzukowski_com/constants/colors.dart';
import 'package:wzukowski_com/constants/size.dart';
import 'package:wzukowski_com/constants/sns_links.dart';
import 'package:wzukowski_com/widgets/contact_desktop.dart';
import 'package:wzukowski_com/widgets/contact_mobile.dart';
import 'package:wzukowski_com/widgets/drawer_mobile.dart';
import 'package:wzukowski_com/widgets/header_desktop.dart';
import 'package:wzukowski_com/widgets/header_mobile.dart';
import 'package:wzukowski_com/widgets/list_of_works_desktop.dart';
import 'package:wzukowski_com/widgets/list_of_works_mobile.dart';
import 'package:wzukowski_com/widgets/site_logo.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
//https://pub.dev/packages/widget_and_text_animator
import 'package:wzukowski_com/widgets/sns.dart';
import 'package:text_scroll/text_scroll.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(3, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth ? null: DrawerMobile(onNavItemTap: (int navIndex){
            scaffoldKey.currentState?.closeEndDrawer();
            scrollToSection(navIndex);
          }),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  key: navbarKeys.first,
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
                      constraints.maxWidth >= kMinDesktopWidth ? HeaderDesktop(onNavMenuTap: (int navIndex){
                        scrollToSection(navIndex);
                      }): HeaderMobile(
                      onLogoTap: (){},
                      onMenuTap: (){
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      ),
                      const SizedBox(width: double.infinity, height: 40),
                      const TextScroll('live visual artist | improviser | composer | ', mode: TextScrollMode.endless, velocity: Velocity(pixelsPerSecond: Offset(40, 0)), style: TextStyle(fontSize: 90, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      const TextScroll('beep boop | dolby atmos | max/msp | vwɔˈʥ̑ĩmʲjɛʃ ʒuˈkɔfsʲci | grandMA3 | dart | touchdesigner | beep boop | ambisonic audio | dolby atmos | video art | ', mode: TextScrollMode.endless, velocity: Velocity(pixelsPerSecond: Offset(40, 0)), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      const TextScroll(
                          'offset | pyramid texts 436 | innermost | concerto for quarter-tone hammond organ | my private property | K5(6) | IT IS NO NIGHT TO DROWN IN | an orange balloon drifting over snow-capped mountains | postludium | luna | ashling scattered over several provinces | ',
                          mode: TextScrollMode.endless,
                          velocity: Velocity(pixelsPerSecond: Offset(38, 0)),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                      const TextScroll(
                          'K5(6) | IT IS NO NIGHT TO DROWN IN | an orange balloon drifting over snow-capped mountains | postludium | luna | ashling scattered over several provinces | soundscapewalks | offset | pyramid texts 436 | innermost | concerto for quarter-tone hammond organ | my private property | ',
                          mode: TextScrollMode.endless,
                          velocity: Velocity(pixelsPerSecond: Offset(36, 0)),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                      const TextScroll(
                          'postludium | luna | ashling scattered over several provinces | offset | pyramid texts 436 | innermost | concerto for quarter-tone hammond organ | my private property | soundscapewalks | K5(6) | IT IS NO NIGHT TO DROWN IN | an orange balloon drifting over snow-capped mountains | ',
                          mode: TextScrollMode.endless,
                          velocity: Velocity(pixelsPerSecond: Offset(34, 0)),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                      const TextScroll(
                          'offset | pyramid texts 436 | innermost | concerto for quarter-tone hammond organ | my private property | K5(6) | IT IS NO NIGHT TO DROWN IN | an orange balloon drifting over snow-capped mountains | postludium | soundscapewalks | luna | ashling scattered over several provinces | ',
                          mode: TextScrollMode.endless,
                          velocity: Velocity(pixelsPerSecond: Offset(37, 0)),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                      const TextScroll(
                          'concerto for quarter-tone hammond organ | my private property | K5(6) | IT IS NO NIGHT TO DROWN IN | an orange balloon drifting over snow-capped mountains | postludium | soundscapewalks | luna | ashling scattered over several provinces | offset | pyramid texts 436 | innermost | ',
                          mode: TextScrollMode.endless,
                          velocity: Velocity(pixelsPerSecond: Offset(39, 0)),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                      const SizedBox(
                        width: double.maxFinite,
                        height: 60
                      )
                    ],
                  ),
                ),
                // SELECTED WORKS
                Container(
                  height: constraints.maxHeight-60,
                  width: double.maxFinite,
                  color: CustomColor.yellowPrimary,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('seleced works', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500, color: CustomColor.blackPrimary)),
                          InkWell(
                            onTap: (){
                              js.context.callMethod('open', [SnsLinks.linktree]);
                            },
                            child: const Text('socials', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: CustomColor.blackPrimary, decoration: TextDecoration.underline, decorationColor: CustomColor.blackPrimary))
                            )
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 50,
                        child: EasyWebView(key: const Key('firstpiece'), width: constraints.maxWidth/4, height: constraints.maxHeight/3.5, src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1453435387&color=%233c2d4f&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                      ),
                      Positioned(
                        top: 60,
                        right: 0,
                        child: EasyWebView(
                            key: const Key('secondpiece'),
                            width: constraints.maxHeight / 2.5,
                            height: constraints.maxHeight / 3.5,
                            src: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1591642207&color=%233c2d4f&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true'),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 100,
                        child: EasyWebView(
                            key: const Key('thirdpiece'),
                            width: constraints.maxHeight / 2.5,
                            height: constraints.maxHeight / 3.5,
                            src:
                                'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1552634386&color=%233c2d4f&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true'),
                      )
                    ],
                  ),
                ),
                // LIST OF WORKS
                Container(
                  key: navbarKeys[1],
                  width: double.maxFinite,
                  color: CustomColor.blackPrimary,
                  child: constraints.maxWidth >= kMinDesktopWidth ? const ListOfWorksDesktop() : const ListOfWorksMobile()
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Divider(thickness: 3, height: 0, color: CustomColor.whitePrimary),
                ),
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
                // Contact
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Divider(thickness: 3, height: 0, color: CustomColor.whitePrimary),
                ),
                Container(key: navbarKeys[2], child: constraints.maxWidth >= kMinDesktopWidth ? const ContactDesktop() : const ContactMobile()),
                // FOOTER
                Container(
                  color: CustomColor.blackPrimary,
                  width: double.maxFinite,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: SiteLogo(),
                      ),
                      Sns()
                    ],
                  )
                )
              ],
            ),
          )
        );
      }
    );
  }

  void scrollToSection(int navIndex){
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}