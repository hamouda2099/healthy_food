import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/main.dart';
import 'package:healthy_food/views/screens/cart_screen.dart';
import 'package:healthy_food/views/screens/home_screen.dart';

class ItemDetailsScreen extends ConsumerWidget {
  ItemDetailsScreen(
      {this.itemName, this.image, required this.price, this.time});
  String? itemName;
  String? time;
  String price;
  String? image;
  final counterProvider = StateProvider<int>((ref) => 1);
  final totalProvider = StateProvider<String>((ref) => "0");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(totalProvider.notifier).state =
          (ref.read(counterProvider.notifier).state * num.parse(price))
              .toString();
    });
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            child: SvgPicture.asset(
              "assets/icons/item_details.svg",
              width: screenWidth,
              height: screenHeight / 1.3,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                40.h,
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      navigator(context: context, screen: HomeScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                40.h,
                Image.asset(
                  "assets/images/$image.png",
                  width: screenWidth / 2,
                  fit: BoxFit.fill,
                ),
                40.h,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemName ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Builder(builder: (context) {
                          return Consumer(
                            builder: (context, ref, child) {
                              final counter = ref.watch(counterProvider);
                              final total = ref.watch(totalProvider);
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (counter != 1) {
                                          ref
                                              .read(counterProvider.notifier)
                                              .state--;
                                          ref
                                              .read(totalProvider.notifier)
                                              .state = (counter *
                                                  num.parse(price ?? "0"))
                                              .toStringAsFixed(2);
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                    10.w,
                                    Text(counter.toString()),
                                    10.w,
                                    InkWell(
                                      onTap: () {
                                        ref
                                            .read(counterProvider.notifier)
                                            .state++;
                                        ref.read(totalProvider.notifier).state =
                                            (counter * num.parse(price ?? "0"))
                                                .toStringAsFixed(2);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        })
                      ],
                    ),
                    30.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$price LE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "Pizza & Chicken & Tomatoes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    30.h,
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                        ),
                        10.w,
                        Text(
                          "4.9",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "450 calories",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    final total = ref.watch(totalProvider);
                    final counter = ref.watch(counterProvider);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "$total LE",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        )
                      ],
                    );
                  },
                ),
                20.h,
                InkWell(
                  onTap: () {
                    CartScreen.cart.add({
                      "name": itemName,
                      "image": image,
                      "price": price,
                      "count": ref.read(counterProvider.notifier).state
                    });
                  },
                  child: Container(
                    width: screenWidth / 2,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.shopping_cart),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Checkout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                40.w,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
