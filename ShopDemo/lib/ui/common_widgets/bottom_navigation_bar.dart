import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/app_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final String currentPage;

  const CustomBottomNavigationBar({Key key, this.currentPage})
      : super(key: key);
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60,
      child: Row(
        children: <Widget>[
          NavigateItem(
            content: Pages.home,
            icon: CupertinoIcons.home,
            onTap: () {
              Get.toNamed(AppRouter.home);
            },
            currentPage: widget.currentPage,
          ),
          NavigateItem(
            content: Pages.folder,
            icon: CupertinoIcons.folder,
            onTap: () {
              Get.toNamed(AppRouter.folder);
            },
            currentPage: widget.currentPage,
          ),
          NavigateItem(
            content: Pages.search,
            icon: CupertinoIcons.search,
            onTap: () {
              Get.toNamed(AppRouter.search);
            },
            currentPage: widget.currentPage,
          ),
          NavigateItem(
            content: Pages.liked,
            icon: CupertinoIcons.heart,
            onTap: () {
              Get.toNamed(AppRouter.liked);
            },
            currentPage: widget.currentPage,
          ),
          NavigateItem(
            content: Pages.info,
            icon: CupertinoIcons.info,
            onTap: () {
              Get.toNamed(AppRouter.info);
            },
            currentPage: widget.currentPage,
          ),
        ],
      ),
    );
  }
}

class NavigateItem extends StatelessWidget {
  final IconData icon;
  final String content;
  final Function onTap;
  final String currentPage;

  const NavigateItem(
      {Key key,
      @required this.icon,
      @required this.content,
      @required this.onTap,
      @required this.currentPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isSelected = currentPage == content;
    return Expanded(
      child: isSelected
          ? ElasticIn(
              duration: Duration(milliseconds: 500),
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(232, 150, 15, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(icon),
                      Text(
                        content,
                        style: defaultStyleBold,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Colors.blueGrey,
                    ),
                    // Text(content),
                  ],
                ),
              ),
            ),
    );
  }
}
