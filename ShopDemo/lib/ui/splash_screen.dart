import 'package:ShopDemo/ui/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(Duration(milliseconds: 2000), () {
        Get.offAllNamed(AppRouter.home);
      });
    } else {
      Future.delayed(Duration(milliseconds: 2000), () {
        Get.offAllNamed(AppRouter.signIn);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.4, 0.9],
          colors: [
            Colors.deepOrange[50] ?? Colors.deepOrange,
            Colors.blueGrey,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 90.0),
      child: Image.asset(
        'assets/images/app_logo.png',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
