import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/oops-svg.svg',
              height: 200,
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Text(
              "Sorry! this feature not available now!.\nwe will be updating soon",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "this feature is available now",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            InkWell(
              onTap: () {
                Get.off(HomePage());
              },
              child: Container(
                height: 80,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff32BEA6),
                ),
                child: Text(
                  "Go back to home",
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
