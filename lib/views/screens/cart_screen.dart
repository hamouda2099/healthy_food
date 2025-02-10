import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/main.dart';
import 'package:healthy_food/views/screens/home_screen.dart';
import 'package:healthy_food/views/screens/thanks_screen.dart';

import '../components/bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  static List cart = [];
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          20.h,
          InkWell(
            onTap: () {
              navigator(context: context, screen: HomeScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: screenWidth / 3,
                                          height: screenWidth / 3,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF83BA7B),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image.asset(
                                              "assets/images/pizza.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              cart[index]['name'] ?? "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            20.h,
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF47B8C1),
                                                  boxShadow: boxShadow,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                  ),
                                                  10.w,
                                                  Text(
                                                      "${cart[index]['count']}"),
                                                  10.w,
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            20.h,
                                            Text(
                                              "${(cart[index]['count'] * double.parse(cart[index]['price'])).toStringAsFixed(2)} LE",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              )
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/mon.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              10.w,
                              Text(
                                "Cash",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 22),
                              ),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.grey,
                              ),
                              20.w,
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: SizedBox(
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Add Promo",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Builder(builder: (context) {
                          double total = 0;
                          for (var element in cart) {
                            total = total + (element['count'] * double.parse(element['price']));
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${total.toStringAsFixed(2)} LE",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 22),
                              ),
                            ],
                          );
                        }),
                        InkWell(
                          onTap: (){
                            navigator(context: context, screen: ThanksScreen());
                          },
                          child: Container(
                            width: 200,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
