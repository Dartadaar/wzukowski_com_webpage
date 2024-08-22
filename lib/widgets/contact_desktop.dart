import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.blackPrimary,
      width: double.maxFinite,
      height: 750,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: Text('Get in Touch', style: TextStyle(fontSize: 46)),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('Name', style: TextStyle(fontSize: 18)),
                  ),
                  const CustomTextField(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('Email', style: TextStyle(fontSize: 18)),
                  ),
                  const CustomTextField(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child:
                        Text('Message', style: TextStyle(fontSize: 18)),
                  ),
                  const CustomTextField(maxLines: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SizedBox(
                        width: 140,
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {
                              js.context
                                  .callMethod('open', ['mailto:wl.zukowski@outlook.com?subject=Website message']);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColor.yellowPrimary,
                                foregroundColor: CustomColor.blackPrimary),
                            child: const Text('Send',
                                style: TextStyle(fontSize: 18)))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//mailto:wl.zukowski@outlook.com?subject=Website message &body=this is an article on how to use the mailto link