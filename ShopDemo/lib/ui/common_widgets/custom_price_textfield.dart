import 'package:ShopDemo/global/const.dart';
import 'package:flutter/material.dart';

class CustomPriceTextField extends StatelessWidget {
  final double price;
  final bool isSale;
  

  const CustomPriceTextField(
      {Key key, this.price, this.isSale = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      numberFormatter.format(price) + 'đ',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: isSale ? Color.fromRGBO(213, 50, 50, 1) : Colors.black,
      ),
    );
  }
}

class CustomPriceBeforeDiscountTextField extends StatelessWidget {
  final double price;
  final Color color;

  const CustomPriceBeforeDiscountTextField({Key key, this.price, this.color = const Color.fromRGBO(166, 166, 166, 1)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      numberFormatter.format(price) + 'đ',
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: color,
          decoration: TextDecoration.lineThrough),
    );
  }
}
