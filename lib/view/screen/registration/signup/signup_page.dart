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
  late TextEditingController nameController,
      emergencyNumberController,
      bioTextController;
  String? dob;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController = TextEditingController();
    bioTextController = TextEditingController();

    emergencyNumberController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emergencyNumberController.dispose();
    super.dispose();
  }

  String? gender;

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
                          hintText: "Guardian Number",
                          keyboardType: TextInputType.number,
                          textEditingController: emergencyNumberController),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            const Text('Male'),
                            Radio<String>(
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ]),
                          Row(children: [
                            const Text('Female'),
                            Radio<String>(
                              value: "female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ]),
                          Row(children: [
                            const Text('Other'),
                            Radio<String>(
                              value: "other",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ]),
                        ],
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
                RoundedRectPrimaryButton(
                    text: "Continue", onpressed: _onPressed),
                const SizedBox(
                  height: kDefaultPadding,
                ),
              ]))),
    );
  }

  void _onPressed() {}
}
