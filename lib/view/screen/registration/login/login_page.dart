import 'package:farmer_app/api/register_api.dart';
import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/widgets/buttons/rounded_rect_button.dart';
import 'package:farmer_app/view/widgets/textfiels_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MobileEntry extends StatefulWidget {
  const MobileEntry({Key? key}) : super(key: key);

  @override
  _MobileEntryState createState() => _MobileEntryState();
}

class _MobileEntryState extends State<MobileEntry> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController countryController = TextEditingController(text: "+91");
  String mobile = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        body: Container(
          width: size.width,
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(
                    "assets/svg/login-svg.svg",
                    width: size.width - kDefaultPadding * 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Sign in/Sign up",
                    style: TextStyle(
                      fontSize: 19,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Enter your mobile to continue",
                    style: TextStyle(
                      fontSize: 10,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      children: [
                        TextFieldCustom(
                          hintText: "",
                          textEditingController: countryController,
                          width: 70,
                        ),
                        const SizedBox(
                          width: kDefaultPadding,
                        ),
                        Expanded(
                          child: TextFieldCustom(
                              hintText: "mobile",
                              keyboardType: TextInputType.number,
                              textEditingController: mobileController),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  RoundedRectPrimaryButton(
                      loading: isLoading,
                      text: "Continue",
                      onpressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        int statusCode = await RegisterApi.emailCheck(
                                mobile: mobileController.text,
                                countryCode: countryController.text)
                            .whenComplete(() {
                          setState(() {
                            isLoading = false;
                          });
                        });
                        print("status on mobile : $statusCode");
                        if (statusCode == 200) {
                          // Get.to(OtpPage(
                          //   mobile: mobileController.text,
                          //   countryCode: countryController.text,
                          // ));
                          print("Success");
                        } else {
                          // Get.to(OtpPage());
                        }
                      })
                ]),
          ),
        ),
      ),
    );
  }
}
