import 'package:ShopDemo/utils/dialog_utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

class InitFlutterLocalNotification {


  
  static Future<void> init() async {

    var initializationSettingAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: initializationSettingAndroid, iOS: initializationSettingIOS);
    await plugin.initialize(initializationSettings, onSelectNotification: _selectNoty);
  }

  static Future _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {
    DialogUtils.showDialog(
        title: title,
        body: body,
        onYes: () {
          // Get.offNamed(AppRouter.home);
        });
  }

  static Future _selectNoty(String payload) async {
    print('select noti ne');
    //TODO
  }
}
