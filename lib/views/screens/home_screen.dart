import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/enum.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/main.dart';
import 'package:healthy_food/views/screens/breakfast_screen.dart';
import 'package:healthy_food/views/screens/coffee_screen.dart';
import 'package:healthy_food/views/screens/dinner_screen.dart';
import 'package:healthy_food/views/screens/lunch_screen.dart';

import '../components/bottom_nav_bar.dart';
import '../components/side_menu.dart';

class HomeScreen extends ConsumerWidget {
  final tabProvider = StateProvider<String?>((ref) => null);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(tabProvider.notifier).state = null;
    });
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Color(0xFFE6E6E6),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/green_curve.png",
            height: screenHeight / 4.5,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                30.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap:(){
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: SvgPicture.asset("assets/icons/menu.svg")),
                    SvgPicture.asset("assets/icons/notification.svg"),
                  ],
                ),

                150.h,
                Consumer(
                  builder: (context, ref, child) {
                    final tab = ref.watch(tabProvider);
                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  ref.read(tabProvider.notifier).state =
                                      "breakfast";
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: tab == "breakfast"
                                      ? BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(100))
                                      : null,
                                  child: Text(
                                    "Breakfast",
                                    style: TextStyle(
                                        color: tab == "breakfast"
                                            ? Colors.white
                                            : kPrimaryColor),
                                  ),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                onTap: () {
                                  ref.read(tabProvider.notifier).state =
                                      "lunch";
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: tab == "lunch"
                                      ? BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(100))
                                      : null,
                                  child: Text(
                                    "lunch",
                                    style: TextStyle(
                                        color: tab == "lunch"
                                            ? Colors.white
                                            : kPrimaryColor),
                                  ),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                onTap: () {
                                  ref.read(tabProvider.notifier).state =
                                      "dinner";
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: tab == "dinner"
                                      ? BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(100))
                                      : null,
                                  child: Text(
                                    "Dinner",
                                    style: TextStyle(
                                        color: tab == "dinner"
                                            ? Colors.white
                                            : kPrimaryColor),
                                  ),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                onTap: () {
                                  ref.read(tabProvider.notifier).state =
                                      "coffee";
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: tab == "coffee"
                                      ? BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(100))
                                      : null,
                                  child: Text(
                                    "Coffee",
                                    style: TextStyle(
                                        color: tab == "coffee"
                                            ? Colors.white
                                            : kPrimaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          10.h,
                          tab == null
                              ? Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Offer",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                        ),
                                        10.h,
                                        SizedBox(
                                          width: screenWidth,
                                          height: screenHeight / 6,
                                          child: ListView.builder(
                                              itemCount: 1,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  width: screenWidth / 1.2,
                                                  height: screenHeight / 6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF03909C),
                                                          Color(0xFF186C73)
                                                        ],
                                                        stops: [0, 1],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                      )),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Today’s offer",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Discont 10%",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Image.asset(
                                                            "assets/images/pizza.png")
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        50.h,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Popular",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                        ),
                                        10.h,
                                        SizedBox(
                                          width: screenWidth,
                                          height: screenHeight / 3,
                                          child: ListView.builder(
                                              itemCount: popular.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 100),
                                                      width: screenWidth / 2,
                                                      height:
                                                          screenHeight / 3.5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFF40900B)
                                                                  .withOpacity(
                                                                      0.4),
                                                              Color(0xFF2FD859)
                                                                  .withOpacity(
                                                                      0.6)
                                                            ],
                                                            stops: [0, 1],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              popular[index][
                                                                      'name'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amberAccent,
                                                                ),
                                                                10.w,
                                                                Text(
                                                                  "4.9",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              "450 calories",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              "${popular[index]['price'] ?? ""} LE",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      "assets/images/${popular[index]['image']}.png",
                                                      width: screenWidth / 2,
                                                      height: screenWidth / 2.3,
                                                      fit: BoxFit.fill,
                                                    )
                                                  ],
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : 0.w,
                          tab == "breakfast" ? BreakfastScreen() : 0.w,
                          tab == "lunch" ? LunchScreen() : 0.w,
                          tab == "dinner" ? DinnerScreen() : 0.w,
                          tab == "coffee" ? CoffeeScreen() : 0.w,
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
