import 'package:flutter/material.dart';

class CustomButtonDialog extends StatelessWidget {
  final Function? onPressed;
  final double? height;
  final double? minWidth;
  final double? btnRadius;
  final Color? contentColor;
  final Color? background;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Widget? child;

  const CustomButtonDialog(
      {Key? key,
      required this.onPressed,
      this.height,
      this.minWidth,
      this.btnRadius,
      this.contentColor,
      this.background,
      this.borderColor,
      this.padding,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: minWidth ?? 88,
        height: height ?? 35,
        child: ElevatedButton(
          onPressed: onPressed as void Function()?,
          child: Container(child: child),
          style: ElevatedButton.styleFrom(
            padding: padding,
            backgroundColor: background,
            foregroundColor: contentColor,
            disabledBackgroundColor: Colors.grey[300],
            disabledForegroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius ?? 5),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
