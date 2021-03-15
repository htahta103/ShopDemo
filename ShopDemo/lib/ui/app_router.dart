import 'package:ShopDemo/ui/boarding_screen/boarding_screen.dart';
import 'package:ShopDemo/ui/sign_in_screen.dart';
import 'package:ShopDemo/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String boarding = '/boarding';
  static const String signIn = '/signIn';

  static PageRouteBuilder _pageRouteBuilder(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _pageRouteBuilder(
          settings,
          SplashScreen(),
        );
      case signIn:
        return _pageRouteBuilder(
          settings,
          SignInScreen(),
        );
      case boarding:
        return _pageRouteBuilder(
          settings,
          BoardingScreen(),
        );
    }
  }
}
