

import 'package:flutter/material.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/views/screens/profile_screen.dart';

import '../../main.dart';
import '../components/custom_text_field.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              child: Column(
                children: [
                  80.h,
                  Text(
                    "My Addresses",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  30.h,
                  CustomField(
                    width: screenWidth/1.5,
                    controller: TextEditingController(),
                    hint: "Address",
                  ),
                  10.h,
                  CustomField(
                    width: screenWidth/1.5,
                    controller: TextEditingController(),
                    hint: "Apartment,Suite,etc",
                  ),
                  10.h,
                  CustomField(
                    width: screenWidth/1.5,
                    controller: TextEditingController(),
                    hint: "City",
                  ),
                  10.h,
                  CustomField(
                    width: screenWidth/1.5,
                    controller: TextEditingController(),
                    hint: "Zip / Postal Code",
                  ),
                  30.h,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap:(){
                          navigator(context: context, screen: ProfileScreen());
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Save",style: TextStyle(
                            color: kPrimaryColor,
                              fontWeight: FontWeight.bold

                          ),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          navigator(context: context, screen: ProfileScreen());
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Cancel",style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
