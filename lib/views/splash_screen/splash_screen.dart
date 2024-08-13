import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/views/Home_screen/Home.dart';
import 'package:e_commerce/views/auth_screen/login_screen.dart';
import 'package:e_commerce/widgets_common/applogo_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating a method to change screen
 changeScreen(){
   Future.delayed(Duration(seconds: 3),(){
     //Get.to(()=>LoginScreen());
     auth.authStateChanges().listen((User ? user) {
       if(user==null && mounted){
         Get.to(()=>const LoginScreen());
       } else{
         Get.to(()=>const Home());
       }
     });

   });
 }
  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            // our splash screen UI is completed...
          ],
        ),
      ),
    );
  }
}
