import 'package:flutter/material.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/views/screens/profile_screen.dart';

class SideMenu extends Drawer {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.h,
            Image.asset("assets/images/user.png",width: 100,height: 100,),
            20.h,
            Text("Marwan",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
            20.h,
            Divider(),
            20.h,
            Text("Menu",style: TextStyle(color: Colors.grey,),),
            30.h,


            InkWell(
              onTap: (){
                navigator(context: context, screen: ProfileScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.person_outline_rounded,color: Colors.white,),
                  10.w,
                  Text("Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                ],
              ),
            ),
            30.h,
            InkWell(
              onTap: (){
                navigator(context: context, screen: ProfileScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.receipt_outlined,color: Colors.white,),
                  10.w,
                  Text("History",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                ],
              ),
            ),
            30.h,
            InkWell(
              onTap: (){
                navigator(context: context, screen: ProfileScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.credit_card,color: Colors.white,),
                  10.w,
                  Text("Wallet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                ],
              ),
            ),
            30.h,
            InkWell(
              onTap: (){
                navigator(context: context, screen: ProfileScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.notifications_active_outlined,color: Colors.white,),
                  10.w,
                  Text("Notifications",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                ],
              ),
            ),
            20.h,
          ],
        ),
      ),
    );
  }
}
