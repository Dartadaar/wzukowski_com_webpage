import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:wzukowski_com/constants/sns_links.dart';

class Sns extends StatelessWidget {
  const Sns({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
                  spacing: 22,
                  runSpacing: 12,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          js.context.callMethod('open', [SnsLinks.instagram]);
                        },
                        child: Image.asset('assets/images/instagram.png', width: 15,)),
                    InkWell(
                        onTap: () {
                          js.context.callMethod('open', [SnsLinks.youtube]);
                        },
                        child: Image.asset('assets/images/youtube.png', width: 18)),
                    InkWell(
                        onTap: () {
                          js.context.callMethod('open', [SnsLinks.soundcloud]);
                        },
                        child: Image.asset('assets/images/soundcloud.png', width: 18)),
                    InkWell(
                        onTap: () {
                          js.context.callMethod('open', [SnsLinks.spotify]);
                        },
                        child: Image.asset('assets/images/spotify.png', width: 16)),
                  ],
                );
  }
}