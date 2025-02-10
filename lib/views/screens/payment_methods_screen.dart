

import 'package:flutter/material.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/views/screens/profile_screen.dart';

import '../../config/navigator.dart';
import '../../main.dart';
import '../components/custom_text_field.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            40.h,
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: (){
                  navigator(context: context, screen: ProfileScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 30,),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              width: screenWidth / 1.2,
              // height: screenHeight / 2,
              decoration: BoxDecoration(
                  boxShadow: boxShadow,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [kPrimaryColor, Color(0xFFDDE1E1)],
                    stops: [0, 1],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
              child: Column(
                children: [
                  80.h,
                  Text(
                    "Payment Methods",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Credit Cards",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  30.h,
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 30),
                    child: Divider(color: Colors.white,),
                  ),
                  30.h,
                 Container(
                   width: screenWidth/1.5,
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Image.asset("assets/images/visa.png",),
                       10.w,
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text("4086148238059709"),
                             Text("Default Payment"),

                           ],
                         ),
                       ),
                       10.w,
                       Icon(Icons.arrow_forward_ios_rounded,)
                     ],
                   ),
                 ),
                 10.h,
                 Container(
                   width: screenWidth/1.5,
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Image.asset("assets/images/master.png",),
                       10.w,
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text("4086148238059709"),
                             Text("Not Default"),

                           ],
                         ),
                       ),
                       10.w,
                       Icon(Icons.arrow_forward_ios_rounded,)
                     ],
                   ),
                 ),
                  50.h,
                  Container(
                    width: screenWidth/1.5,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Add Cards",style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  20.h,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
