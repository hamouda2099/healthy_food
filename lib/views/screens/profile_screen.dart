import 'package:flutter/material.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/main.dart';
import 'package:healthy_food/views/components/bottom_nav_bar.dart';
import 'package:healthy_food/views/screens/auth_screen.dart';
import 'package:healthy_food/views/screens/edit_address_screen.dart';
import 'package:healthy_food/views/screens/edit_profile_screen.dart';
import 'package:healthy_food/views/screens/payment_methods_screen.dart';

import '../../config/navigator.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    navigator(context: context, screen: HomeScreen());
                  },
                  child
                      : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                  ),
                ),

                InkWell(
                  onTap: (){
                  },
                  child
                      : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.edit,color: Colors.white,),
                  ),
                ),
              ],
            ),
            20.h,
            Container(
              padding: EdgeInsets.all(20),
              width: screenWidth/1.2,
              // height: screenHeight/5,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/profile_bg.png"),fit: BoxFit.fill)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/user.png",width: 40,height: 40,),
                  20.h,
                  Text("Marwan",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  10.h,
                  Text("marawanatef3@gmail.com",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  10.h,
                  Text("+201060482406",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            20.h,
            Expanded(
             child: Container(
               width: screenWidth,
               decoration:BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Color(0xFF166A71), Color(0xFFDDE1E1)],
                     stops: [0, 1],
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                   ),),
               child: Column(
                 children: [
                   30.h,
                   InkWell(
                     onTap: (){
                       navigator(context: context, screen: EditProfileScreen());

                     },
                     child: Container(
                       padding: EdgeInsets.all(10),
                       width: screenWidth/1.1,
                       color: Color(0xFFE9E9E9),
                       child: Row(
                         children: [
                           Icon(Icons.person_outline_rounded),
                           10.w,
                           Text("Edit my profile",style: TextStyle(
                             fontSize: 16
                           ),),
                           Spacer(),
                           Icon(Icons.keyboard_arrow_right,size: 30,),

                         ],
                       ),
                     ),
                   ),
                   30.h,
                   InkWell(
                     onTap: (){
                       navigator(context: context, screen: PaymentMethodsScreen());

                     },
                     child: Container(
                       padding: EdgeInsets.all(10),
                       width: screenWidth/1.1,
                       color: Color(0xFFE9E9E9),
                       child: Row(
                         children: [
                           Icon(Icons.credit_card_outlined),
                           10.w,
                           Text("Payment Methods",style: TextStyle(
                               fontSize: 16
                           ),),
                           Spacer(),
                           Icon(Icons.keyboard_arrow_right,size: 30,),

                         ],
                       ),
                     ),
                   ),
                   30.h,
                   InkWell(
                     onTap: (){
                       navigator(context: context, screen: EditAddressScreen());

                     },
                     child: Container(
                       padding: EdgeInsets.all(10),
                       width: screenWidth/1.1,
                       color: Color(0xFFE9E9E9),
                       child: Row(
                         children: [
                           Icon(Icons.location_on_outlined),
                           10.w,
                           Text("Address",style: TextStyle(
                               fontSize: 16
                           ),),
                           Spacer(),
                           Icon(Icons.keyboard_arrow_right,size: 30,),

                         ],
                       ),
                     ),
                   ),
                   
                   Spacer(),
                   InkWell(
                     onTap: (){
                       navigator(context: context, screen: AuthScreen());
                     },
                     child: Container(
                       width: screenWidth/1.2,
                       padding: EdgeInsets.all(15),
                       decoration: BoxDecoration(
                         color: Color(0xFFE9E9E9),
                         borderRadius: BorderRadius.circular(100)
                       ),
                       alignment: Alignment.center,
                       child: Text("Logout",style: TextStyle(color: kPrimaryColor),),
                     ),
                   ),
                   20.h,

                 ],
               ),
               ) ,
             ),

          ],
        ),
      ),
    );
  }
}
