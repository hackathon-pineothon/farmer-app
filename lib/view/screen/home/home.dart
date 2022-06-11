import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/home/itme_container.dart';
import 'package:farmer_app/view/screen/item-page/item_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          kSizedBox,
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  child: Image.network(
                    "https://st.depositphotos.com/1004077/4652/v/950/depositphotos_46528741-stock-illustration-rain-as-a-background-vector.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "N",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "98ppm",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          kSizedBox,
          Text(
            "Items for sale",
            style: TextStyle(
              color: kPrimaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          kSizedBox,
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPadding,
              crossAxisSpacing: kDefaultPadding,
              children: [
                for (int i = 0; i < 10; i++)
                  InkWell(
                    onTap: () {
                      Get.to(ItemPage());
                    },
                    child: ItemContainer(
                        width: size.width / 2 - kDefaultPadding * 1.5,
                        name: "orange",
                        price: 200,
                        imgUrl: "assets/png/cauliflower.png",
                        totalLeft: 30),
                  )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
