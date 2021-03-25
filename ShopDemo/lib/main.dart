import 'package:ShopDemo/core/viewmodel/providers.dart';
import 'package:ShopDemo/global/global_data.dart';
import 'package:ShopDemo/global/locator.dart';
import 'package:ShopDemo/startups/init_firebase_messaging.dart';
import 'package:ShopDemo/startups/init_flutter_locali_notification.dart';
import 'package:ShopDemo/ui/app_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    initStartup();
    locator<GlobalData>().expiredDate = DateTime.now().add(const Duration(minutes: 30));
  }

  Future<void> initStartup() async {
    await InitFlutterLocalNotification.init();
    await InitFirebaseMessaging.init(_firebaseMessaging);
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewmodelProviders],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        initialRoute: AppRouter.home,
      ),
    );
  }
}


