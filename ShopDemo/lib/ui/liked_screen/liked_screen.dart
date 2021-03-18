import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LikedScreen extends StatefulWidget {
  @override
  _LikedScreenState createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: Pages.liked
      ),
      body: Container(
        child: Text('liked'),
      ),
    );
  }
}
