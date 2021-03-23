import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/bottom_navigation_bar.dart';
import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget/tabbar_content.dart';
import 'package:ShopDemo/ui/home_screen/shop_home_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class StandardIndicatorController {}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(
          title: 'SHOP DEMO',
          onMailPressed: () {},
          onCartPressed: (){},
          controller: controller,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: Pages.home,
      ),
      body: TabbarContent(
        controller: controller,
        children: <Widget>[
          ShopHomeScreen(),
          Container(color: Colors.red),
          Container(color: Colors.purple),
          Container(color: Colors.pink),
          Container(color: Colors.blue),
          Container(color: Colors.grey),
        ],
      ),
    );
  }
}
