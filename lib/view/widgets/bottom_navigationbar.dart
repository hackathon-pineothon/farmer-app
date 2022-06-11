import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/home/home.dart';
import 'package:farmer_app/view/screen/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/crop-suggessions/crop_suggessions.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({Key? key, required this.currentIndex})
      : super(key: key);
  final int currentIndex;

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const CropSuggessions(),
      const ProfilePage()
    ];
    return BottomNavigationBar(
      backgroundColor: kWhite,
      currentIndex: widget.currentIndex,
      onTap: (newIndex) {
        setState(() {
          if (newIndex != widget.currentIndex) {
            Get.to(pages[newIndex]);
          }
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: widget.currentIndex == 0 ? kPrimaryTextColor : Colors.grey,
              size: 28,
            ),
            label: "home"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.event,
            color: widget.currentIndex == 1 ? kPrimaryTextColor : Colors.grey,
            size: 28,
          ),
          label: "suggessions",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: widget.currentIndex == 1 ? kPrimaryTextColor : Colors.grey,
            size: 28,
          ),
          label: "profile",
        ),
      ],
    );
  }
}
