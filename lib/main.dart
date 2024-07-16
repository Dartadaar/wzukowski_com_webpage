import 'package:flutter/material.dart';
import 'package:wzukowski_com/pages/homepage.dart';
import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: Theme.of(context).textTheme.apply(
        //   fontSizeFactor: 1.1
        // ),
        brightness: Brightness.dark,
        fontFamily: 'Gopher',
        primaryColor: CustomColor.whitePrimary
      ),
      title: 'Włodzimierz Żukowski',
      home: const Homepage(),
      );
  }
}