import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar_header_viewmodel.dart';
import 'package:flutter/material.dart';

class TabbarHeaderViewmodel extends ChangeNotifier
    implements ITabbarHeaderViewmodel {
  int _currentIndex;
  @override
  int get currentIndex => _currentIndex;
  TabbarHeaderViewmodel(){
    _currentIndex = 0;
  }
  
  @override
  void onPageChange(int idx) {
    _currentIndex = idx;
    function(idx);
    notifyListeners();
  }

  @override
  Function function;

}
