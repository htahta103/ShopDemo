import 'package:flutter/material.dart';

class CustomButtonDialog extends StatelessWidget {
  final Function onPressed;
  final double height;
  final double minWidth;
  final double btnRadius;
  final Color contentColor;
  final Color background;
  final Color borderColor;
  final EdgeInsets padding;
  final Widget child;

  const CustomButtonDialog(
      {Key key,
      @required this.onPressed,
      this.height = 35,
      this.minWidth = double.infinity,
      this.btnRadius = 5,
      this.contentColor = Colors.white,
      this.background = Colors.lightGreen,
      this.borderColor = Colors.transparent,
      this.padding,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: minWidth,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Container(child: child),
          style: ElevatedButton.styleFrom(
            padding: padding,
            backgroundColor: background,
            foregroundColor: contentColor,
            disabledBackgroundColor: Colors.grey[300],
            disabledForegroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius),
              side: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
