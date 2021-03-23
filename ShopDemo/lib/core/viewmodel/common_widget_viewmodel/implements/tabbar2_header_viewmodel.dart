import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/iTabbar2_header_viewmodel.dart';
import 'package:flutter/material.dart';

class Tabbar2HeaderViewmodel extends ChangeNotifier
    implements ITabbar2HeaderViewmodel {
  int _currentIndex = 0;
  @override
  int get currentIndex => _currentIndex;
  Tabbar2HeaderViewmodel() {
    init();
  }

  @override
  void onPageChange(int idx) {
    _currentIndex = idx;
    function(idx);
    notifyListeners();
  }

  @override
  Function function;

  @override
  void init() {
    if(currentIndex != 0){
    _currentIndex = 0;
    onPageChange(0);
    }
  }
}
