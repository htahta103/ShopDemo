import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class InitFirebaseMessaging {
  static Future<void> init(FirebaseMessaging firebaseMessaging) async {
    //Request notify on IOS
    await firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(alert: true, sound: true, badge: true, provisional: true),
    );

  firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      var platformMessage;
      if(Platform.isIOS){
        platformMessage = message;
      }else{
        
      }
    }
  );

  }

}
