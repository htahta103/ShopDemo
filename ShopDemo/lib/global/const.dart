import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String defaultFont = 'Roboto';
TextStyle defaultStyle = TextStyle();
TextStyle defaultStyleBold = TextStyle( fontWeight: FontWeight.w600);
var numberFormatter = new NumberFormat("#,###");
class Pages{
  static String home = 'home';
  static String folder = 'folder';
  static String search = 'search';
  static String liked = 'liked';
  static String info = 'info';
}