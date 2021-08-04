import 'package:ShopDemo/core/viewmodel/interfaces/iproduct_detail_test_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailTestViewmodel extends ChangeNotifier
    implements IProductDetailTestViewmodel {
  bool _isShowHeader;
  bool get isShowHeader => _isShowHeader;
  ProductDetailTestViewmodel() {
    _isShowHeader = false;
    _currentIndex = 0;
  }
  @override
  void init() {}

  @override
  void setShowHeader(bool isShow) {
    if (isShow != _isShowHeader) {
      _isShowHeader = isShow;
      notifyListeners();
    }
  }

  int _currentIndex;
  int get currentIndex => _currentIndex;

  @override
  void setCurrentIndex(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
