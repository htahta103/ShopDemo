import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ILoginScreenViewmodel extends ChangeNotifier{
  Future<void> onGoogleSignIn(BuildContext context){}
  Future<void> onEmailSignIn(BuildContext context, String email, String password){}
}