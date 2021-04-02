import 'package:ShopDemo/core/viewmodel/interfaces/ilogin_screen_view_model.dart';
import 'package:ShopDemo/global/global_data.dart';
import 'package:ShopDemo/global/locator.dart';
import 'package:ShopDemo/ui/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreenViewmodel extends ChangeNotifier
    implements ILoginScreenViewmodel {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;
  bool isUserSignIn = false;
  User user;


  LoginScreenViewmodel() {
    Firebase.initializeApp().then((FirebaseApp defaultApp) {
      _auth = FirebaseAuth.instanceFor(app: defaultApp);
      locator<GlobalData>().auth = _auth;
      _checkIfUserLogin();
    });
  }

  void _checkIfUserLogin() {}

  Future<User> _handleSignIn() async {
    bool userSignIn = await _googleSignIn.isSignedIn();

    isUserSignIn = userSignIn;

    if (isUserSignIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      user = (await _auth.signInWithCredential(credential)).user;

      userSignIn = await _googleSignIn.isSignedIn();

      isUserSignIn = userSignIn;

      //TODO save user to globaldata
    }
  }

  void _handleEmailSignIn(){
    
  }

  Future<void> onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    onSignInSuccess();
    //TODO Navigate to some page
    // var userSignedIn = Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       // builder: (context) => WelcomeUserWidget(user, _googleSignIn)),
    //       builder: (context) => MainChat()),
    // );
    //   isUserSignIn = userSignedIn == null;
  }

  @override
  Future<void> onEmailSignIn(BuildContext context, String email, String password) async {
    user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    final User currentUser = await _auth.currentUser;
    if(user.uid == currentUser.uid)
      onSignInSuccess();
  }

  void onSignInSuccess(){
if(user != null)
    Get.offAllNamed(AppRouter.home);
  }
}
