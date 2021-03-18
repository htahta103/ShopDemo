import 'package:ShopDemo/ui/common_widgets/custom_app_bar.dart';
import 'package:ShopDemo/ui/folder_screen/folder_screen.dart';
import 'package:ShopDemo/ui/home_screen/home_screen.dart';
import 'package:ShopDemo/ui/info_screen/info_screen.dart';
import 'package:ShopDemo/ui/liked_screen/liked_screen.dart';
import 'package:ShopDemo/ui/search_screen/search_screen.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  final titles = ['Home', 'Folder', 'Search', 'Liked', 'Profile'];
  final colors = [
    Colors.blueAccent,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.cyan
  ];
  final icons = [
    CupertinoIcons.home,
    CupertinoIcons.folder,
    CupertinoIcons.search,
    CupertinoIcons.heart,
    CupertinoIcons.info,
  ];
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {},
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          checkUserDragging(scrollNotification);
        },
        child: PageView(
          pageSnapping: false,
          controller: _pageController,
          children: widget.titles.map((String title) {
            switch (title) {
              case 'Home':
                return HomeScreen();
              case 'Folder':
                return FolderScreen();
              case 'Search':
                return SearchScreen();
              case 'Liked':
                return LikedScreen();
              case 'Info':
                return InfoScreen();
              default:
                return HomeScreen();
            }
            return null;
          }).toList(),
          onPageChanged: (page) {},
        ),
      ),
      bottomNavigationBar: BubbledNavigationBar(
        controller: _menuPositionController,
        initialIndex: 0,
        itemMargin: EdgeInsets.symmetric(horizontal: 8),
        backgroundColor: Color.fromRGBO(44, 44, 44,1),
        defaultBubbleColor: Colors.blue,
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.easeInOutQuad,
              duration: Duration(milliseconds: 500));
        },
        items: widget.titles.map((title) {
          var index = widget.titles.indexOf(title);
          var color = widget.colors[index];
          return BubbledNavigationBarItem(
            icon: getIcon(index, color),
            activeIcon: getIcon(index, Colors.white),
            bubbleColor: Color.fromRGBO(232, 150, 15,1),
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      ),
    );
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }
}
