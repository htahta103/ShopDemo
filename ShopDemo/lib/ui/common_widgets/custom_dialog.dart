import 'package:ShopDemo/ui/common_widgets/custom_button.dart';
import 'package:ShopDemo/ui/common_widgets/custom_button_dialog.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<DialogBtns> listBtn;

  const CustomDialog({Key key, this.title, this.content, this.listBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildListBtn() {
      return listBtn.map((btn) {
        return Container(
          width: 100,
          child: CustomButtonDialog(
            onPressed: btn.onPressed,
            contentColor: btn.contentColor,
            background: btn.background,
            child: Text(
              btn.content,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList();
    }
    return AlertDialog(title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(content),
      actions: <Widget>[
        ..._buildListBtn(),
        SizedBox(width: 12),
      ],
    );
  }
}

class DialogBtns {
  final Function onPressed;
  final String content;
  final Color background;
  final Color contentColor;
  //TODO
  DialogBtns(
      {this.onPressed,
      this.content = '',
      this.background = Colors.blueGrey,
      this.contentColor = Colors.black54});
}
