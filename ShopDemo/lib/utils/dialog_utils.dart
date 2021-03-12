import 'package:ShopDemo/ui/common_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<void> showDialog(
      {String title, String body, Function onYes, Function onNo}) async {
    if (onNo == null) onNo = () => {Get.back()};
    if (onYes == null) onYes = () => {Get.back()};

    await Get.dialog(CustomDialog(
      title: title,
      content: body,
      listBtn: [
        DialogBtns(
          onPressed: onNo,
          content: 'No',
          background: Colors.black26,
          contentColor: Colors.white
        ),
        DialogBtns(
          onPressed: onYes,
          content: 'Yes',
        ),
      ],
    ));
  }
}
