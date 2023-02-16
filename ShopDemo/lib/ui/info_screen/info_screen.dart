import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_router.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'INFO',
        onBackPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: Pages.info,
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(child: Text('Log out')),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Get.offAllNamed(AppRouter.signIn);
        },
      ),
      body: Container(
        child: Text('info'),
      ),
    );
  }
}
