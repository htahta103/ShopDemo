import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/global/global_data.dart';
import 'package:ShopDemo/global/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FlashSaleWidget extends StatelessWidget {
  var globalData = locator<GlobalData>();

  DateTime getExpiredTime() {
    var expiredTime = (globalData.expiredDate.difference(new DateTime.now()));
    var convertExpiredTime = new DateTime(0, 0, expiredTime.inDays,
        expiredTime.inHours, expiredTime.inMinutes, expiredTime.inSeconds);
    return convertExpiredTime;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        constraints: BoxConstraints(minWidth: constraint.maxWidth),
        child: Column(
          children: [
            buildFlashSaleExpiredTime(),
            SizedBox(
              height: 10,
            ),
            buildSaleProduct(),
          ],
        ),
      );
    });
  }

  Widget buildFlashSaleExpiredTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Flash Sale',
          style: defaultStyleBold,
        ),
        TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
          var expiredTime = getExpiredTime();
          return InkWell(
            onTap: () {},
            child: Row(children: [
              Text(
                'End in',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              customText(DateFormat("HH").format(expiredTime)),
              Text(
                ':',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              customText(DateFormat("mm").format(expiredTime)),
              Text(
                ':',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              customText(DateFormat("ss").format(expiredTime)),
              SizedBox(
                width: 5,
              ),
              Icon(
                CupertinoIcons.right_chevron,
                size: 14,
              ),
            ]),
          );
        }),
      ],
    );
  }

  Widget buildSaleProduct() {
    return Container(
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
         flashSaleItem(),
         flashSaleItem(),
         flashSaleItem(),
         flashSaleItem(),
         flashSaleItem(),
        ],
      ),
    );
  }
}

Widget customText(String value) {
  return Container(
    padding: EdgeInsets.all(2),
    margin: EdgeInsets.all(2),
    color: Colors.black,
    child: Text(
      value,
      style: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
    ),
  );
}

Widget flashSaleItem({double price = 100000, double salePrice = 99000}){
  return  Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            height: 200,
            width: 150,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/default_product.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      numberFormatter.format(salePrice) + 'đ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(213, 50, 50, 1),
                      ),
                    ),
                    Text(
                     numberFormatter.format(price) + 'đ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(166, 166, 166, 1),
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Container(
                  width: 30,
                  height: 30,
                  color: Color.fromRGBO(252, 211, 101,1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(FontAwesomeIcons.angleDoubleDown,size: 10,),
                      Text('1%',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),),
                    ],
                  ),
                ),
              ],
            ),
          );
}