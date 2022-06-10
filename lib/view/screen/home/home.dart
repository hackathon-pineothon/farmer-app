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
        child: Column(children: [
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
