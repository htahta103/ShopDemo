import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../utils/utils.dart';

FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

class InitFlutterLocalNotification {
  static Future<void> init() async {
    var initializationSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        android: initializationSettingAndroid, iOS: initializationSettingIOS);
    await plugin.initialize(initializationSettings,
        onSelectNotification: _onReceive);
  }

  static Future _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    DialogUtils.showDialog(
        title: title,
        body: body,
        onYes: () {
          // Get.offNamed(AppRouter.home);
        });
  }

  static Future _onReceive(response) async {
    print('select noti ne');
    //TODO
  }
}
