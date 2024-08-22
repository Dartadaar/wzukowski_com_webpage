import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  _ContactMobileState createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.blackPrimary,
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Get in Touch', style: TextStyle(fontSize: 46)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('Name', style: TextStyle(fontSize: 18)),
                ),
                CustomTextField(controller: _nameController),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('Email', style: TextStyle(fontSize: 18)),
                ),
                CustomTextField(controller: _emailController),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('Message', style: TextStyle(fontSize: 18)),
                ),
                CustomTextField(controller: _messageController, maxLines: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: SizedBox(
                    width: 140,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        final name = _nameController.text;
                        final email = _emailController.text;
                        final message = _messageController.text;

                        final mailtoLink = Uri.encodeFull(
                          'mailto:wl.zukowski@outlook.com?subject=Website message from $name&body=Name: $name\nEmail: $email\n\nMessage:\n$message',
                        );

                        js.context.callMethod('open', [mailtoLink]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowPrimary,
                        foregroundColor: CustomColor.blackPrimary,
                      ),
                      child: const Text('Send', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
