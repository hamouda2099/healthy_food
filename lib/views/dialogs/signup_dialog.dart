import 'package:flutter/material.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/main.dart';
import 'package:healthy_food/views/screens/home_screen.dart';

void signupDialog(BuildContext context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Sign up"),
          Text("Successful"),
          10.h,
          Container(
            width: 50,height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                shape: BoxShape.circle,
                
              ),
              child: Image.asset("assets/images/person.png",width: 30,height: 30,)),
          10.h,
          InkWell(
            onTap: (){
              navigator(context: context, screen: HomeScreen());
            },
            child: Container(
              width: screenWidth/2,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)
              ),alignment: Alignment.center,
              child: Text("Go To Home",style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
            ),
          )
        ],
      ),
    );
  });
}


void passwordResetDialog(BuildContext context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Password Changed"),
          Text("Successful"),
          10.h,
          Image.asset("assets/images/check.png",width: 50,height: 50,),
          10.h,
          InkWell(
            onTap: (){
              navigator(context: context, screen: HomeScreen());
            },
            child: Container(
              width: screenWidth/2,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)
              ),alignment: Alignment.center,
              child: Text("Go To Home",style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            ),
          )
        ],
      ),
    );
  });
}