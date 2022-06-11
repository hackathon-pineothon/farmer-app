import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmer_app/view/constants/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CarouselSlider(options: CarouselOptions(), items: [
              Container(
                width: size.width,
                child: Image.network(
                  "https://www.plantcelltechnology.com/product_images/uploaded_images/banana-tree.jpg",
                  width: size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: kGreenSecondary,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: Text(
                "22 slots",
                style: TextStyle(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Banana",
                style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "expires in 11 pm",
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 16,
                ),
              ),
              Text(
                "total 200kg",
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 16,
                ),
              ),
              Text(
                "10kg/slot",
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Text(
                    "average price ",
                    style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "11rs/kg",
                    style: TextStyle(
                        color: kGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: kGrey,
          width: size.width,
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: kGrey.withOpacity(0.1),
                            border: Border.all(
                                color: i < 7 ? kGreen : kPrimaryTextColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          i < 7 ? "11" : "10",
                          style: TextStyle(
                            color: i < 7 ? kGreen : kPrimaryTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )
                  ],
                ),
              )),
        ),
      ]),
    ));
  }
}
