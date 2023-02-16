import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget/custom_tabbar_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function? onBackPressed;
  final Function? onMailPressed;
  final Function? onCartPressed;
  final String? title;
  final Widget? child;
  final PageController? controller;
  final Color? color;
  final Color? shadowColor;

  const CustomAppBar({
    Key? key,
    this.onBackPressed,
    this.title,
    this.child,
    this.controller,
    this.onMailPressed,
    this.onCartPressed,
    this.color,
    this.shadowColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color != null ? color : Colors.white,
      shadowColor: shadowColor != null ? shadowColor : null,
      centerTitle: true,
      actions: [
        onCartPressed != null
            ? IconButton(
                icon: Icon(
                  CupertinoIcons.cart,
                  color: Color.fromRGBO(157, 158, 163, 1),
                ),
                onPressed: onCartPressed as void Function()?,
              )
            : SizedBox()
      ],
      leading: onMailPressed != null
          ? IconButton(
              icon: Icon(
                CupertinoIcons.mail,
                color: Color.fromRGBO(157, 158, 163, 1),
              ),
              onPressed: onMailPressed as void Function()?,
            )
          : (onBackPressed != null
              ? IconButton(
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Color.fromRGBO(157, 158, 163, 1),
                  ),
                  onPressed: onBackPressed as void Function()?,
                )
              : null),
      title: child == null
          ? (title != null
              ? Text(
                  this.title!,
                  style: TextStyle(
                    fontFamily: defaultFont,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                )
              : null)
          : child,
      bottom: controller != null
          ? PreferredSize(
              preferredSize: Size(130.0, 300.0),
              child: Container(
                child: TabbarHeader(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black54,
                  controller: controller,
                  tabs: [
                    Tab(
                      text: 'Shop',
                    ),
                    Tab(text: "Men"),
                    Tab(text: 'Women'),
                    Tab(text: 'Child'),
                    Tab(text: 'Bigsize'),
                    Tab(text: 'Accessories'),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(50);
  }
}
