import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentPage: Pages.home,),
      body: Container(
        child: Text('homescreen'),
      ),
    );
  }
}
