import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/home/home.dart';
import 'package:farmer_app/view/screen/registration/login/login_page.dart';
import 'package:farmer_app/view/screen/registration/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/find-friends/find_friends.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(fontWeight: FontWeight.normal, color: kWhite, fontSize: 16);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 250,
      color: kPrimaryTextColor,
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Get.to(FindFriends());
            },
            leading: Icon(
              Icons.search,
              color: kWhite,
              size: 22,
            ),
            title: const Text(
              "find friends",
              style: textStyle,
            ),
          ),
          ListTile(
            onTap: () {
              // Get.to(const FindFriends());
            },
            leading: const Icon(
              Icons.people_alt_rounded,
              color: kWhite,
            ),
            title: const Text(
              "list friends",
              style: textStyle,
            ),
          ),
          ListTile(
              onTap: () {
                // Get.to(const EventCreation());
              },
              title: const Text(
                "create event",
                style: textStyle,
              ),
              leading: Icon(
                Icons.event,
                color: kWhite,
                size: 22,
              )),
          ListTile(
              onTap: () {
                // Get.to(const ChatScreen());
              },
              title: const Text(
                "about us",
                style: textStyle,
              ),
              leading: Icon(
                Icons.people_alt_rounded,
                color: kWhite,
                size: 22,
              )),
          Spacer(),
          ListTile(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.clear();
                Get.off(MobileEntry());
              },
              title: const Text(
                "logout",
                style: textStyle,
              ),
              leading: Icon(
                Icons.logout,
                color: kWhite,
                size: 22,
              )),
        ],
      ),
    );
  }
}
