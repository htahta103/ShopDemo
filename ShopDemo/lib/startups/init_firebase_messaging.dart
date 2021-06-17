// import 'dart:convert';

// import 'package:ShopDemo/startups/init_flutter_locali_notification.dart';
// import 'package:ShopDemo/utils/dialog_utils.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:io';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class InitFirebaseMessaging {
//   static Future<void> init(FirebaseMessaging firebaseMessaging) async {
//     //Request notify on IOS
//     await firebaseMessaging.requestPermission();

//     firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         _showItemDialog(message);
//       },
//       onBackgroundMessage: _myBackgroundMessageHandler,
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         // _navigateToItemDetail(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         // _navigateToItemDetail(message);
//       },
//     );
//     firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(
//             sound: true, badge: true, alert: true, provisional: true));
//     firebaseMessaging.onIosSettingsRegistered
//         .listen((IosNotificationSettings settings) {
//       print("Settings registered: $settings");
//     });
//     firebaseMessaging.getToken().then((String token) {
//       assert(token != null);
//       print("Push Messaging token: $token");
//     });
//   }
// }

// Future<dynamic> _myBackgroundMessageHandler(
//     Map<String, dynamic> message) async {
//   var platformMessage = message['data'];
//   var androidPlatformNotificationDetails = AndroidNotificationDetails(
//     'Noti',
//     'Noti Channel',
//     'Noti Channel',
//     importance: Importance.max,
//     priority: Priority.min,
//     ticker: 'ticker',
//   );
//   var iOSPlatformNotificationDetails = IOSNotificationDetails();

//   var notificationDetails = NotificationDetails(
//     android: androidPlatformNotificationDetails,
//     iOS: iOSPlatformNotificationDetails,
//   );
//   await plugin.show(
//     0,
//     platformMessage['msgTitle'],
//     platformMessage['msgBody'],
//     notificationDetails,
//     payload: jsonEncode(platformMessage),
//   );
// }

// // Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
// //   if (message.containsKey('data')) {
// //     final dynamic data = message['data'];
// //   }

// //   if (message.containsKey('notification')) {
// //     final dynamic notification = message['notification'];
// //   }
// // }

// void _showItemDialog(Map<String, dynamic> message) async {
//   var platformMsg = message['data'];
//   await DialogUtils.showDialog(
//       body: message['title'].toString(), title: platformMsg['msgBody']);

//   var androidPlatformNotificationDetails = AndroidNotificationDetails(
//     'Noti',
//     'Noti Channel',
//     'Noti Channel',
//     importance: Importance.max,
//     priority: Priority.min,
//     ticker: 'ticker',
//   );
//   var iOSPlatformNotificationDetails = IOSNotificationDetails();

//   var notificationDetails = NotificationDetails(
//     android: androidPlatformNotificationDetails,
//     iOS: iOSPlatformNotificationDetails,
//   );
//   await plugin.show(
//     0,
//     platformMsg['msgTitle'],
//     platformMsg['msgBody'],
//     notificationDetails,
//     payload: jsonEncode(platformMsg),
//   );
// }
