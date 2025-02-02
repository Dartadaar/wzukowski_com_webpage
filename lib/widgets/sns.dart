import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                      onTap: () async {
                        await launchUrl(Uri.parse(SnsLinks.instagram));
                      },
                      child: Image.asset('assets/images/instagram.png', width: 15,)),
                    InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(SnsLinks.youtube));
                      },
                      child: Image.asset('assets/images/youtube.png', width: 18)),
                    InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(SnsLinks.soundcloud));
                      },
                      child: Image.asset('assets/images/soundcloud.png', width: 18)),
                    InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(SnsLinks.spotify));
                        },
                        child: Image.asset('assets/images/spotify.png', width: 16)),
                  ],
                );
  }
}