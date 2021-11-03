import 'package:ShopDemo/core/viewmodel/interfaces/ilogin_screen_view_model.dart';
import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/app_router.dart';
import 'package:ShopDemo/ui/common_widgets/custom_button.dart';
import 'package:ShopDemo/ui/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _nodeUsername = FocusNode();

  final FocusNode _nodePassword = FocusNode();

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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Color.fromRGBO(157, 158, 163, 1),
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: KeyboardActions(
        config: _keyboardActionsConfig(context),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign in',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: defaultFont,
                ),
              ),
              CustomTextFormField(
                option: TextFieldOption(),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontFamily: defaultFont,
                ),
              ),
              CustomTextFormField(
                option: TextFieldOption(),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                option: CustomButtonOption(
                  haveGradient: true,
                  onTap: () async {
                    await _loginViewmodel.onEmailSignIn(
                        context, 'htahta103@gmail.com', '1122330');
                  },
                  content: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: defaultFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: defaultStyle,
                  ),
                  TextButton(
                    child: Text(
                      'Sign Up',
                      style: defaultStyle,
                    ),
                    onPressed: () {
                      Get.toNamed(AppRouter.signUp);
                    },
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Or Sign In with',
                  style: TextStyle(
                      fontFamily: defaultFont,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400],
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Google',
                            style: defaultStyleBold,
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      await _loginViewmodel.onGoogleSignIn(context);
                    },
                  ),
                  FlatButton(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400],
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/facebook_icon.png',
                            fit: BoxFit.scaleDown,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Facebook', style: defaultStyleBold),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      // await _loginViewmodel.onGoogleSignIn(context);
                      //TODO
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
