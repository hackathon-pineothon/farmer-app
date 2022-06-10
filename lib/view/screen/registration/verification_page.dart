import 'package:farmer_app/api/register_api.dart';
import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/widgets/buttons/rounded_rect_button.dart';
import 'package:farmer_app/view/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  const OtpPage(
      {Key? key,
      required this.mobile,
      required this.countryCode,
      required this.passedOtp})
      : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
  final String mobile;
  final String countryCode;
  final String passedOtp;
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController countryController = TextEditingController(text: "+91");
  String token = "";
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
                    "assets/svg/otp-svg.svg",
                    width: size.width - kDefaultPadding * 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Otp Verification",
                    style: TextStyle(
                      fontSize: 19,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Enter the OTP to continue",
                    style: TextStyle(
                      fontSize: 10,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: OtpTextField(
                        length: 6,
                        keyboardType: TextInputType.number,
                        width: 40,
                        onEntered: (String verificationCode) {
                          token += verificationCode;
                        },
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  RoundedRectPrimaryButton(
                      text: "Continue",
                      onpressed: () async {
                        int status = await RegisterApi.verificationApi(
                            mobile: widget.mobile,
                            countryCode: widget.countryCode,
                            otp: widget.passedOtp);
                      })
                ]),
          ),
        ),
      ),
    );
  }
}
