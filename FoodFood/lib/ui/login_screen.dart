import 'package:FoodFood/core/viewmodel/interfaces/ilogin_screen_viewmodel.dart';
import 'package:FoodFood/ui/common_widgets/custom_button.dart';
import 'package:FoodFood/ui/common_widgets/custom_textfield.dart';
import 'package:FoodFood/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _nodeUsername = FocusNode();

  final FocusNode _nodePassword = FocusNode();

  bool _hidePassword = true;
  ILoginScreenViewmodel _loginViewmodel;

  @override
  void initState() {
    super.initState();
    _loginViewmodel =
        Provider.of<ILoginScreenViewmodel>(context, listen: false);
  }

  KeyboardActionsConfig _keyboardActionsConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeUsername,
        ),
        KeyboardActionsItem(
          focusNode: _nodePassword,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardActions(
        config: _keyboardActionsConfig(context),
        child: Center(
          child: Container(
            width: 300,
            height: MediaQuery.of(context).size.height - 50,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    'FoodFood',
                    style: DefaultTextStyleApp(
                      FontOption(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FaIcon(
                  FontAwesomeIcons.cannabis,
                  size: 100,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  isUserNameField: true,
                ),
                SizedBox(
                  height: 14,
                ),
                CustomTextField(
                  isUserNameField: false,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  option: CustomButtonOption(
                    onTap: () async {
                      await _loginViewmodel.onEmailSignIn(
                          context, 'htahta103@gmail.com', '1122330');
                    },
                    content: Text(
                      'SignIn with Account',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  option: CustomButtonOption(
                    onTap: () async {
                      await _loginViewmodel.onGoogleSignIn(context);
                    },
                    content: Text(
                      'SignIn with Google',
                      style: TextStyle(fontSize: 15),
                    ),
                    prefixIcon: FontAwesomeIcons.google,
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
