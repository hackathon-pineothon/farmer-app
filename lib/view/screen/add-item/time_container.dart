import 'package:farmer_app/view/constants/constats.dart';
import 'package:flutter/material.dart';

class ExpiryOverlay extends StatelessWidget {
  const ExpiryOverlay({
    Key? key,
    required this.expiryDateString,
    this.width = double.maxFinite,
  }) : super(key: key);

  final double width;
  final String expiryDateString;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: kDefaultPadding),
        width: width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kWhite,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: kPrimaryTextColor.withOpacity(0.1),
              )
            ]),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              Icons.child_friendly_outlined,
              color: kPrimaryTextColor,
              size: 18,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              expiryDateString == "" ? "end date" : expiryDateString,
              style: TextStyle(
                color: kPrimaryTextColor.withOpacity(.7),
                fontSize: 16,
              ),
            )
          ],
        ));
  }
}
