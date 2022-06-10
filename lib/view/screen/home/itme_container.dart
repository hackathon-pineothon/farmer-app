import 'package:farmer_app/view/constants/constats.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    Key? key,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.totalLeft,
    required this.width,
  }) : super(key: key);
  final String name;
  final int price;
  final String imgUrl;
  final int totalLeft;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 200,
            width: width,
            decoration: BoxDecoration(
              color: kItemContainerBg,
              borderRadius: BorderRadius.circular(10),
            ),
            // padding: EdgeInsets.all(kDefaultPadding / 2),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    imgUrl,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "base price 100rs/kg",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "$totalLeft left",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: kGreen,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Text(
              "${price} slots",
              style: TextStyle(
                  color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
