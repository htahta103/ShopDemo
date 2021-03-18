import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  @override
  _FolderScreenState createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentPage: Pages.folder,),
      body: Container(
        child: Text('folder'),
      ),
    );
  }
}