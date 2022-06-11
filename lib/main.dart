import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/home/home.dart';
import 'package:farmer_app/view/screen/registration/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.roboto(
            fontSize: 16,
            color: kPrimaryTextColor,
          ).fontFamily),
      home: const MobileEntry(),
    );
  }
}
