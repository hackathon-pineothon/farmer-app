import 'dart:convert';
import 'dart:io';
import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/add-item/calender_container.dart';
import 'package:farmer_app/view/screen/add-item/time_container.dart';
import 'package:farmer_app/view/screen/home/home.dart';
import 'package:farmer_app/view/widgets/buttons/rounded_rect_button.dart';
import 'package:farmer_app/view/widgets/textfiels_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  File? storedImage;
  XFile? image;
  final cropController = TextEditingController();
  final quantityController = TextEditingController();
  final slotController = TextEditingController();
  String expryDateString = "ennd date";
  DateTime? expiryDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/svg/back.svg",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "add post",
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  storedImage == null
                      ? Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width -
                              kDefaultPadding * 5,
                          width: MediaQuery.of(context).size.width -
                              kDefaultPadding * 2,
                          child: const Text("no image added"),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryTextColor.withOpacity(0.1),
                          ),
                        )
                      : Image.file(
                          storedImage!,
                          width: MediaQuery.of(context).size.width,
                        ),
                  GestureDetector(
                    onTap: imageAdd,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: kPrimaryTextColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.add_a_photo,
                        color: kWhite,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldCustom(
                  hintText: "item", textEditingController: cropController),
              kSizedBox,
              Row(
                children: [
                  Expanded(
                    child: TextFieldCustom(
                      hintText: "quantity",
                      textEditingController: quantityController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: TextFieldCustom(
                      hintText: "slot",
                      textEditingController: slotController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              kSizedBox,
              InkWell(
                  onTap: () {
                    late OverlayEntry calenderOverlay;
                    calenderOverlay = OverlayEntry(
                        builder: (context) => CalenderOverlay(
                            onDateChanged: (date) {
                              setState(() {
                                expiryDate = date;
                                expryDateString = _toDMY(date);
                                calenderOverlay.remove();
                              });
                            },
                            calenderOverlay: calenderOverlay));
                    Overlay.of(context)?.insert(calenderOverlay);
                  },
                  child: ExpiryOverlay(expiryDateString: expryDateString)),
              kSizedBox,
              RoundedRectPrimaryButton(
                  text: "next",
                  onpressed: () {
                    Get.off(HomePage());
                  })
            ],
          ),
        ),
      ),
    );
  }

  imageAdd() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image

    image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      storedImage = File(image!.path);
    });

// copy the file to a new path
  }
}

String _toDMY(DateTime dateTime) {
  return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
}
