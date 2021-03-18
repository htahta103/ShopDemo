import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: Pages.info,
      ),
      body: Container(
        child: Text('info'),
      ),
    );
  }
}
