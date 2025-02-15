import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/views/components/custom_text_field.dart';
import 'package:healthy_food/views/screens/forget_password_screen.dart';
import 'package:healthy_food/views/screens/home_screen.dart';

import '../../main.dart';
import '../dialogs/signup_dialog.dart';

class AuthScreen extends ConsumerWidget {
  final authTypeProvider = StateProvider<String>((ref) => "login");
  PageController pageController  = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final view = ref.watch(authTypeProvider);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/bg.png"),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: screenWidth / 1.2,
              height: screenHeight / 1.5,
              decoration: BoxDecoration(
                  boxShadow: boxShadow,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      kPrimaryColor,
                      Color(0xFFDDE1E1),
                    ],
                    stops: [0, 1],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth / 1.5,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              ref.read(authTypeProvider.notifier).state =
                                  "login";
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: view == "login"
                                  ? BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20))
                                  : null,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: view == "login"
                                        ? Colors.orange
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            ref.read(authTypeProvider.notifier).state =
                                "signup";
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: view == "signup"
                                  ? BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20))
                                  : null,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: view == "signup"
                                        ? Colors.orange
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        )),
                      ],
                    ),
                  ),
                  20.h,
                  view == "login"
                      ? Column(
                          children: [
                            CustomField(
                              controller: TextEditingController(),
                              width: screenWidth / 1.5,
                              hint: "Username",
                              icon: Icon(
                                Icons.person,
                                color: Colors.black.withOpacity(.4),
                              ),
                              action: Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.red,
                              ),
                            ),
                            20.h,
                            CustomField(
                              controller: TextEditingController(),
                              width: screenWidth / 1.5,
                              secure: true,
                              hint: "Password",
                              icon: Icon(
                                Icons.person,
                                color: Colors.black.withOpacity(.4),
                              ),
                              action: Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.red,
                              ),
                            ),
                            10.h,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40.0, right: 40),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: (){
                                    navigator(context: context, screen: ForgetPasswordScreen());

                                  },
                                  child: Text(
                                    "Forget Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F3E42)),
                                  ),
                                ),
                              ),
                            ),
                            20.h,
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: (){
                                  navigator(context: context, screen: HomeScreen());
                                },
                                child: Container(
                                  width: screenWidth / 1.2,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: screenHeight / 2.2,
                          child: PageView(
                            controller: pageController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomField(
                                      controller: TextEditingController(),
                                      width: screenWidth / 1.5,
                                      hint: "Username",
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black.withOpacity(.4),
                                      ),
                                      action: Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.red,
                                      ),
                                    ),
                                    20.h,
                                    CustomField(
                                      controller: TextEditingController(),
                                      width: screenWidth / 1.5,
                                      hint: "Email",
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.black.withOpacity(.4),
                                      ),
                                      action: Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.red,
                                      ),
                                    ),
                                    20.h,
                                    CustomField(
                                      controller: TextEditingController(),
                                      width: screenWidth / 1.5,
                                      secure: true,
                                      hint: "Password",
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black.withOpacity(.4),
                                      ),
                                      action: Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.red,
                                      ),
                                    ),
                                    20.h,
                                    CustomField(
                                      controller: TextEditingController(),
                                      width: screenWidth / 1.5,
                                      secure: true,
                                      hint: "Confirm Password",
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black.withOpacity(.4),
                                      ),
                                      action: Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.red,
                                      ),
                                    ),
                                    20.h,
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: InkWell(
                                        onTap: (){
                                          pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeIn);
                                        },
                                        child: Container(
                                          width: screenWidth / 1.2,
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomField(
                                          controller: TextEditingController(),
                                          width: screenWidth / 2.5,
                                          hint: "Weight(KG)",
                                          icon: Icon(
                                            Icons.person,
                                            color: Colors.black.withOpacity(.4),
                                          ),
                                          action: Icon(
                                            Icons.star,
                                            size: 10,
                                            color: Colors.red,
                                          ),
                                        ),
                                        CustomField(
                                          controller: TextEditingController(),
                                          width: screenWidth / 2.5,
                                          hint: "Height(cm)",
                                          icon: Icon(
                                            Icons.person,
                                            color: Colors.black.withOpacity(.4),
                                          ),
                                          action: Icon(
                                            Icons.star,
                                            size: 10,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    20.h,
                                    CustomField(
                                      controller: TextEditingController(),
                                      width: screenWidth / 1.2,
                                      hint: "Gender",
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.black.withOpacity(.4),
                                      ),
                                      action: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 10,
                                        color: Colors.red,
                                      ),
                                    ),
                                    20.h,
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: InkWell(
                                        onTap: (){
                                          signupDialog(context);
                                        },
                                        child: Container(
                                          width: screenWidth / 1.2,
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){
                                        navigator(context: context, screen: HomeScreen());
                                      },
                                      child: Text(
                                        "Skip",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  10.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth / 3,
                        color: Colors.grey,
                        height: 1,
                      ),
                      10.w,
                      Text(
                        "OR",
                        style: TextStyle(
                            color: Color(0xFF0F3E42),
                            fontWeight: FontWeight.bold),
                      ),
                      10.w,
                      Container(
                        width: screenWidth / 3,
                        color: Colors.grey,
                        height: 1,
                      ),
                    ],
                  ),
                  10.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/fb.png",
                        width: 40,
                        height: 40,
                      ),
                      10.w,
                      Image.asset(
                        "assets/images/google.png",
                        width: 40,
                        height: 40,
                      ),
                      10.w,
                      Image.asset(
                        "assets/images/insta.png",
                        width: 40,
                        height: 40,
                      ),
                      10.w,
                      Image.asset(
                        "assets/images/x.png",
                        width: 40,
                        height: 40,
                      ),
                    ],
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
