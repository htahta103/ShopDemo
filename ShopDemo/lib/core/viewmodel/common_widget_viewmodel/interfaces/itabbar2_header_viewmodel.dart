import 'package:flutter/material.dart';

abstract class ITabbar2HeaderViewmodel implements ChangeNotifier{
  void onPageChange(int idx);
  void init();
  int get currentIndex;
  Function function;
}