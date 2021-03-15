import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonOption option;

  const CustomButton({Key key, @required this.option}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: option.onTap,
      child: Container(
        height: option.height,
        width: option.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(option.borderRadius),
          color: option.color != null ? option.color : Colors.yellow,
        ),
        //TODO isAvailable,
        child: Stack(
          children: [
            option.prefixIcon != null
                ? Container(
                    padding: EdgeInsets.only(left: 30),
                    alignment: Alignment.centerLeft,
                    child: FaIcon(option.prefixIcon),
                  )
                : SizedBox(),
            Center(child: option.content),
            option.suffixIcon != null
                ? Container(
                    padding: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: FaIcon(option.suffixIcon))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class CustomButtonOption {
  final Color color;
  final Widget content;
  final Function onTap;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final double borderRadius;
  final double width;
  final double height;
  CustomButtonOption(
      {this.color,
      @required this.onTap,
      @required this.content,
      this.prefixIcon,
      this.suffixIcon,
      this.borderRadius = 10,
      this.width = 335,
      this.height = 44});
}
