import 'package:farmer_app/api/user_api.dart';
import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/widgets/buttons/rounded_rect_button.dart';
import 'package:farmer_app/view/widgets/textfiels_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? dob;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioTextController = TextEditingController();
  TextEditingController acreTextControler = TextEditingController();

  String? gender;

  List<String> interests = [];
  TextEditingController interrestController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: kWhite,
          body: SingleChildScrollView(
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
                  "Basic Details",
                  style: TextStyle(
                    fontSize: 19,
                    color: kPrimaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      TextFieldCustom(
                          hintText: "Name",
                          keyboardType: TextInputType.name,
                          textEditingController: nameController),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      TextFieldCustom(
                          hintText: "land area(in acres)",
                          keyboardType: TextInputType.number,
                          textEditingController: acreTextControler),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Form(
                        child: TextFormField(
                          controller: bioTextController,
                          maxLength: 300,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: kWhite,
                            hintText: "Bio",
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  height: 60,
                  width: size.width - kDefaultPadding * 2,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kBgColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: kPrimaryTextColor.withOpacity(0.1),
                        )
                      ]),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (String interest in interests)
                          InkWell(
                            onTap: () {
                              setState(() {
                                interests.remove(interest);
                              });
                            },
                            child: Container(
                              height: 30,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: kGreen,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                interest,
                                style: TextStyle(color: kWhite, fontSize: 16),
                              ),
                            ),
                          ),
                        SizedBox(
                            width: 160,
                            child: TextField(
                              controller: interrestController,
                              onEditingComplete: () {
                                setState(() {
                                  interests.add(interrestController.text);
                                  interrestController.clear();
                                });
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "add your interests"),
                            ))
                      ],
                    ),
                  ),
                ),
                kSizedBox,
                RoundedRectPrimaryButton(
                    text: "Continue", onpressed: _onPressed),
                kSizedBox,
              ]))),
    );
  }

  void _onPressed() {
    UserApi.updateUserDetails(
        name: nameController.text,
        acre: int.parse(acreTextControler.text),
        bio: bioTextController.text,
        preferedCrops: interests);
  }
}
