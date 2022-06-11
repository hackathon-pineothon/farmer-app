import 'package:farmer_app/view/constants/constats.dart';
import 'package:farmer_app/view/screen/add-item/add_item_one.dart';
import 'package:farmer_app/view/screen/home/appbar.dart';
import 'package:farmer_app/view/screen/home/itme_container.dart';
import 'package:farmer_app/view/screen/item-page/item_page.dart';
import 'package:farmer_app/view/screen/notification/notification.dart';
import 'package:farmer_app/view/widgets/app_drawer.dart';
import 'package:farmer_app/view/widgets/bottom_navigationbar.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBarCustom(currentIndex: 0),
      key: _scaffoldState,
      drawer: AppDrawer(),
      appBar: appBarCustom(
          prefixWidget: Center(
            child: InkWell(
              onTap: () {
                _scaffoldState.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: kPrimaryTextColor,
                size: 22,
              ),
            ),
          ),
          title: "Welcome",
          bgColor: kWhite,
          widgetColor: kPrimaryTextColor,
          suffixWidget: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(NotificationPage());
                },
                child: Icon(
                  Icons.notifications,
                  color: kPrimaryTextColor,
                  size: 22,
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Icon(
                Icons.chat_rounded,
                color: kPrimaryTextColor,
                size: 22,
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddPostPage());
        },
        backgroundColor: kPrimaryTextColor,
        child: Icon(
          Icons.add,
          color: kWhite,
          size: 30,
        ),
      ),
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
                  height: 120,
                  child: Image.network(
                    "https://st.depositphotos.com/1004077/4652/v/950/depositphotos_46528741-stock-illustration-rain-as-a-background-vector.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 120,
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    ChemicalContainer(
                      item: "PH",
                      itemColor: Colors.white,
                      ppm: 35,
                      valColor: Colors.white,
                      bg: kPrimaryTextColor,
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    ChemicalContainer(
                      item: "N",
                      itemColor: Colors.blue,
                      ppm: 98,
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    ChemicalContainer(
                      item: "P",
                      itemColor: Colors.amber.shade500,
                      ppm: 102,
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    ChemicalContainer(
                      item: "K",
                      itemColor: Colors.blueGrey.shade500,
                      ppm: 35,
                    ),
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
                        name: "banana",
                        price: 200,
                        imgUrl: "assets/png/banana.png",
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

class ChemicalContainer extends StatelessWidget {
  const ChemicalContainer({
    Key? key,
    required this.item,
    required this.ppm,
    required this.itemColor,
    this.bg = kItemContainerBg,
    this.valColor = kPrimaryTextColor,
  }) : super(key: key);
  final String item;
  final double ppm;
  final Color itemColor;
  final Color bg;
  final Color valColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item,
            style: TextStyle(
              fontSize: 20,
              color: itemColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$ppm",
                style: TextStyle(
                  fontSize: 18,
                  color: valColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "ppm",
              //   style: TextStyle(
              //     fontSize: 12,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
