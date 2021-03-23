import 'package:flutter/material.dart';

abstract class ITabbarHeaderViewmodel implements ChangeNotifier{
  void onPageChange(int idx);
  int get currentIndex;
  Function function;
}