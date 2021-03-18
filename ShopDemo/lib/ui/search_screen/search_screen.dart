import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentPage: Pages.search,),
      body: Container(
        child: Text('folder'),
      ),
    );
  }
}