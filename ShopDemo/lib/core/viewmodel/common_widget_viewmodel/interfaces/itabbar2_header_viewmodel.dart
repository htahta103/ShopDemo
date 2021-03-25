import 'package:flutter/material.dart';

abstract class ITabbar2HeaderViewmodel implements ChangeNotifier{
  void onPageChange(int idx);
  void init();
  void hideLoading();
  void onMoreItemClick();
  List<String> get tabs;
  int get currentIndex;
  Function function;
  bool get isLoading;
  bool get moreLoading;
  int get currentPage;
  int get pageNumber;
  List<Widget> get items;
  List<Widget> get showItems;

}