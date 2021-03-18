import 'package:ShopDemo/global/const.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onBackPressed;
  final String title;
  final Widget child;

  const CustomAppBar({Key key, this.onBackPressed, this.title, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: onBackPressed != null
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color.fromRGBO(157, 158, 163, 1),
              ),
              onPressed: () {},
            )
          : null,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: child == null
          ? (title != null
              ? Text(
                  this.title,
                  style: TextStyle(
                    fontFamily: defaultFont,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null)
          : child,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(50);
  }
}
