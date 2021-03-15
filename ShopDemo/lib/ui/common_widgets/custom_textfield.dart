import 'package:ShopDemo/global/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
            child: TextFormField(
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

class TextFieldOption {
  final Function(String) onChanged;
  final Function(String) validator;
  final Function(String) onSubmited;
  final Function(String) onTap;
  final double height;
  final double width;
  final FocusNode focuseNode;
  final String placeHolder;
  final int maxline;
  final List<TextInputFormatter> inputFormatter;
  final TextInputType keyboardType;
  final bool enabled;
  final bool obscureText;
  final bool readOnly;
  final bool isRequired;
  final Widget suffixIcon;
  final String label;

  TextFieldOption({
    this.onChanged,
    this.validator,
    this.onSubmited,
    this.onTap,
    this.height,
    this.width,
    this.focuseNode,
    this.placeHolder,
    this.maxline,
    this.keyboardType,
    this.inputFormatter,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.suffixIcon,
    this.isRequired = true,
    @required this.label,
  });
}

class CustomTextFormField extends StatelessWidget {
  final TextFieldOption option;

  const CustomTextFormField({Key key, @required this.option}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: option.label,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color.fromRGBO(100, 100, 100, 1),
                  ),
                ),
                option.isRequired
                    ? TextSpan(
                        text: '*',
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.red),
                      )
                    : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: TextFormField(
              textAlign: TextAlign.start,
              onChanged: option.onChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(173, 173, 173, 1),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(173, 173, 173, 1),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                // suffixIcon: GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     color: Colors.transparent,
                //     child: Container(
                //       padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                //       child: Icon(Icons.remove_red_eye_sharp),
                //     ),
                //   ),
                // ),
                hintText: option.placeHolder,
                hintStyle: TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(201, 201, 201, 1),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
