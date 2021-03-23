import 'package:ShopDemo/ui/boarding_screen/boarding_screen.dart';
import 'package:ShopDemo/ui/folder_screen/folder_screen.dart';
import 'package:ShopDemo/ui/home_screen/home_screen.dart';
import 'package:ShopDemo/ui/info_screen/info_screen.dart';
import 'package:ShopDemo/ui/liked_screen/liked_screen.dart';
import 'package:ShopDemo/ui/search_screen/search_screen.dart';
import 'package:ShopDemo/ui/sign_in_screen.dart';
import 'package:ShopDemo/ui/sign_up_screen.dart/sign_up_screen.dart';
import 'package:ShopDemo/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String boarding = '/boarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String folder = '/folder';
  static const String search = '/search';
  static const String liked = '/liked';
  static const String info = '/info';

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
      case signUp:
        return _pageRouteBuilder(
          settings,
          SignupScreen(),
        );
      case home:
        return _pageRouteBuilder(
          settings,
          HomeScreen(),
        );
      case folder:
        return _pageRouteBuilder(
          settings,
          FolderScreen(),
        );
      case search:
        return _pageRouteBuilder(
          settings,
          SearchScreen(),
        );
      case liked:
        return _pageRouteBuilder(
          settings,
          LikedScreen(),
        );
      case info:
        return _pageRouteBuilder(
          settings,
          InfoScreen(),
        );
    }
  }
}
