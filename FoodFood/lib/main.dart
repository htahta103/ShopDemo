import 'package:FoodFood/core/viewmodel/providers.dart';
import 'package:FoodFood/global/locator.dart';
import 'package:FoodFood/ui/app_router.dart';
import 'package:FoodFood/ui/sign_in_screen.dart';
import 'package:FoodFood/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
