import 'package:flutter/material.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/views/components/custom_text_field.dart';
import 'package:healthy_food/views/screens/profile_screen.dart';

import '../../config/navigator.dart';
import '../../main.dart';
import 'auth_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: InkWell(
            onTap: (){
              navigator(context: context, screen: ProfileScreen());
            },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
      ),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      width: screenWidth / 1.2,
                      height: screenHeight / 1.5,
                      decoration: BoxDecoration(
                          boxShadow: boxShadow,
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [kPrimaryColor, Color(0xFFDDE1E1)],
                            stops: [0, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            80.h,
                            Text(
                              "Artidtaya  Suwanwarich",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Edit My Profile",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            30.h,
                            CustomField(
                              width: screenWidth/1.5,
                              controller: TextEditingController(),
                              hint: "Name",
                            ),
                            10.h,
                            CustomField(
                              width: screenWidth/1.5,
                              controller: TextEditingController(),
                              hint: "E-Mail",
                            ),
                            10.h,
                            CustomField(
                              width: screenWidth/1.5,
                              controller: TextEditingController(),
                              hint: "Phone",
                            ),
                            10.h,
                            SizedBox(
                              width: screenWidth/1.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomField(
                                    width: screenWidth/3,
                                    controller: TextEditingController(),
                                    hint: "Age",
                                  ),
                                  CustomField(
                                    width: screenWidth/3,
                                    controller: TextEditingController(),
                                    hint: "Birthday",
                                  ),
                                ],
                              ),
                            ),
                            10.h,
                            SizedBox(
                              width: screenWidth/1.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomField(
                                    width: screenWidth/3,
                                    controller: TextEditingController(),
                                    hint: "Height (cm) ",
                                  ),
                                  CustomField(
                                    width: screenWidth/3,
                                    controller: TextEditingController(),
                                    hint: "Weight(kg)",
                                  ),
                                ],
                              ),
                            ),
                            10.h,
                            CustomField(
                              width: screenWidth/3,
                              controller: TextEditingController(),
                              hint: "Gender",
                            ),
                            20.h,
                          ],
                        ),
                      ),
                    ),
                    20.h,
                    InkWell(
                      onTap: (){
                        navigator(context: context, screen: ProfileScreen());
                      },
                      child: Container(
                        width: screenWidth/2.5,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        alignment: Alignment.center,
                        child: Text("Update Profile",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/user.png",
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
