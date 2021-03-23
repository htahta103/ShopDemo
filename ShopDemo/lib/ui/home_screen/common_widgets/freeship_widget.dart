import 'package:ShopDemo/global/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Freeship extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        constraints: BoxConstraints(minWidth: constraint.maxWidth),
        height: 40,
        color: Color.fromRGBO(237, 234, 21, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.car),
            SizedBox(
              width: 10,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: 'FREESHIP ',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                TextSpan(text: 'FOR ORDER FROM 499K',style: TextStyle( fontSize: 12, color: Colors.black, )),
              ]),
            )
          ],
        ),
      );
    });
  }
}
