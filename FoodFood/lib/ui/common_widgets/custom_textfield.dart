import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  //----- Add more Param or Class Object to more customize this widget -----

  final bool isUserNameField;

  const CustomTextField({Key key, @required this.isUserNameField})
      : super(key: key);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _nodeUserName = FocusNode();

  final FocusNode _nodePassword = FocusNode();

  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return widget.isUserNameField
        ? Container(
            height: 48,
            child: TextField(
              textAlign: TextAlign.start,
              focusNode: _nodeUserName,
              onChanged: (newText) {
                //TODO
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(191, 15, 291, 1),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(191, 15, 291, 1),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(28, 0, 19, 0),
                  child: Icon(Icons.verified_user),
                ),
                hintText: 'Username',
              ),
            ),
          )
        : Container(
            height: 48,
            child: TextField(
              obscureText: _hidePassword,
              focusNode: _nodePassword,
              textAlign: TextAlign.start,
              onChanged: (newText) {
                // password = newText;
                // _viewmodel.checkLoginAvailable(
                //   username,
                //   password,
                // );
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(191, 15, 291, 1),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(191, 15, 291, 1),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 19, 0),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                      child: _hidePassword
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_sharp),
                    ),
                  ),
                ),
                hintText: 'Password',
              ),
            ),
          );
  }
}
