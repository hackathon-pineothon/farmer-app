import 'dart:convert';
import 'package:farmer_app/view/screen/home/home.dart';
import 'package:farmer_app/view/screen/registration/signup/signup_page.dart';
import 'package:farmer_app/view/screen/registration/verification_page.dart';
import 'package:http/http.dart' as http;
import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "https://app.geekstudios.tech";

class RegisterApi {
  static Future<int> emailCheck(
      {required String mobile, required String countryCode}) async {
    String url = "$baseUrl/auth/v1/login";
    print("url $url");
    final uri = Uri.parse(url);
    print("phone $mobile");
    // print("country $countryCode");
    Map<String, dynamic> body = {"phone": mobile, "account_type": "user"};
    try {
      http.Response response = await http
          .post(
            uri,
            headers: {"Content-Type": "application/json"},
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: 8));

      debugPrint("------------status code------------");
      debugPrint("${response.statusCode}");
      print(response.body);
      debugPrint("st ${jsonDecode(response.body)["status_code"]}");
      debugPrint("message ${jsonDecode(response.body)["message"]}");
      debugPrint("response ${jsonDecode(response.body)}");

      debugPrint("-----------------------------------");
      if (jsonDecode(response.body)["response_code"] == 200) {
        showToast(
            color: kPrimaryTextColor,
            context: Get.overlayContext!,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.check);
        Get.to(OtpPage(
          mobile: mobile,
          countryCode: countryCode,
          passedOtp: jsonDecode(response.body)["response"]["otp"],
        ));
        return 200;
      } else {
        showToast(
            context: Get.overlayContext!,
            color: Colors.orange,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.warning);
        return 400;
      }
    } catch (e) {
      debugPrint("Error occured while registering $e");
      return 501;
    }
  }

  static Future<int> verificationApi(
      {required String mobile,
      required String countryCode,
      required String otp}) async {
    String url = "$baseUrl/auth/v1/validate/otp/";
    print("url $url");
    final uri = Uri.parse(url);
    print("phone $mobile");
    print("country $countryCode");
    final fcmToken = "";
    print("---------------------fcm-------------------");
    print("fcm $fcmToken ");
    print("---------------------fcm-------------------");
    Map<String, dynamic> body = {
      "phone": mobile,
      "otp": otp,
      "device": {
        "fcm": fcmToken,
      }
    };
    try {
      http.Response response = await http
          .post(
            uri,
            headers: {"Content-Type": "application/json"},
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: 8));

      debugPrint("------------status code------------");
      debugPrint("${response.statusCode}");
      debugPrint("st ${jsonDecode(response.body)["status_code"]}");
      debugPrint("message ${jsonDecode(response.body)["message"]}");
      debugPrint("response ${jsonDecode(response.body)}");

      debugPrint("-----------------------------------");
      if (jsonDecode(response.body)["response_code"] == 200) {
        if (jsonDecode(response.body)["response_code"] == 200) {
          showToast(
              color: kPrimaryTextColor,
              context: Get.overlayContext!,
              title: jsonDecode(response.body)["message"],
              description: "",
              icon: Icons.check);

          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(
              "token", jsonDecode(response.body)["response"]["accessToken"]);
          pref.setString(
              "mobile", jsonDecode(response.body)["response"]["user"]["phone"]);

          if (jsonDecode(response.body)["response"]["user"]
                  ["profile_completion"] ==
              0) {
            Get.to(SignupPage());
          } else {
            Get.to(HomePage());
          }
          return 200;
        } else {
          showToast(
              context: Get.overlayContext!,
              color: Colors.orange,
              title: jsonDecode(response.body)["message"],
              description: "",
              icon: Icons.warning);
          return 400;
        }
      } else {
        showToast(
            context: Get.overlayContext!,
            color: Colors.orange,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.warning);

        return 400;
      }
    } catch (e) {
      debugPrint("Error occured while registering $e");
      return 501;
    }
  }
}
