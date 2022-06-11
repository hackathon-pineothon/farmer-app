import 'package:farmer_app/view/constants/constats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget appBarCustom(
    {Widget? prefixWidget,
    required String title,
    Widget? suffixWidget,
    Color? bgColor,
    Color? widgetColor,
    bool? shadow}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56),
    child: Container(
      padding: EdgeInsets.all(kDefaultPadding),
      // height: 55,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: bgColor ?? kPrimaryTextColor, boxShadow: [
        if (shadow == true)
          BoxShadow(color: kPrimaryTextColor.withOpacity(0.2), blurRadius: 20)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixWidget ??
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: widgetColor ?? kWhite,
                    size: 22,
                  )),
          SizedBox(
            width: kDefaultPadding,
          ),
          Text(title,
              style: TextStyle(
                color: widgetColor ?? kWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          const Spacer(),
          suffixWidget ?? const SizedBox(),
        ],
      ),
    ),
  );
}
