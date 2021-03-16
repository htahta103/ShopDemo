import 'package:ShopDemo/global/const.dart';
import 'package:ShopDemo/ui/common_widgets/custom_button.dart';
import 'package:ShopDemo/ui/common_widgets/custom_checkbox.dart';
import 'package:ShopDemo/ui/common_widgets/custom_dropdown_formfield.dart';
import 'package:ShopDemo/ui/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

part 'date_of_birth_widget.dart';
part 'mostly_interested_widget.dart';
part 'contact_prefested_widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(157, 158, 163, 1),
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Sign up',
          style: TextStyle(
            fontFamily: defaultFont,
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                option: TextFieldOption(
                  label: 'Email address',
                  onChanged: (String value) {
                    print(value);
                  },
                  placeHolder: 'Enter email address',
                  suffixIcon: Icon(Icons.email),
                  // focuseNode: ,
                  // validator: ,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We'll send your order confirmation here",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  color: Color.fromRGBO(157, 158, 163, 1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                option: TextFieldOption(
                  label: 'First name',
                  onChanged: (String value) {},
                  placeHolder: 'Enter first name',
                  // suffixIcon: Icon(Icons.email),
                  // focuseNode: ,
                  // validator: ,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                option: TextFieldOption(
                  label: 'Last name',
                  onChanged: (String value) {},
                  placeHolder: 'Enter last name',
                  // suffixIcon: Icon(Icons.email),
                  // focuseNode: ,
                  // validator: ,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                option: TextFieldOption(
                  obscureText: true,
                  label: 'Password',
                  onChanged: (String value) {},
                  placeHolder: 'Enter password',
                  // suffixIcon: Icon(Icons.email),
                  // focuseNode: ,
                  // validator: ,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Must be 10 or more characters",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  color: Color.fromRGBO(157, 158, 163, 1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildDateOfBirth(),
              MostInterested(),
              ContactPrefested(),
              SizedBox(
                height: 100,
              ),
              CustomButton(
                option: CustomButtonOption(
                    content: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: defaultFont,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    color: Color.fromRGBO(143, 95, 67, 1),
                    onTap: () {}),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
