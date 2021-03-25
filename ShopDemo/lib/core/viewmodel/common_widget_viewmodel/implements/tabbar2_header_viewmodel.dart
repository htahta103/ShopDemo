import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar2_header_viewmodel.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget_with_sticky_header.dart/tabbar2_content.dart';
import 'package:flutter/material.dart';

class Tabbar2HeaderViewmodel extends ChangeNotifier
    implements ITabbar2HeaderViewmodel {
  int _currentIndex = 0;
  @override
  int get currentIndex => _currentIndex;

  List<String> _tabs = [];
  @override
  List<String> get tabs => _tabs;

  int _currentPage;
  @override
  int get currentPage => _currentPage;

  bool _isLoading;
  @override
  bool get isLoading => _isLoading;

  bool _moreLoading;
  @override
  bool get moreLoading => _moreLoading;

  int _pageNumber;
  @override
  int get pageNumber => _pageNumber;

  List<Widget> _items = [];
  @override
  List<Widget> get items => _items;

  List<Widget> _showItems = [];
  @override
  List<Widget> get showItems => _showItems;

  Tabbar2HeaderViewmodel() {
    _tabs = ['Hot', 'Favourite', 'Shirt', 'T-Shirt', 'Shoes', 'Asso'];
    init();
  }

  @override
  void onPageChange(int idx) {
    _isLoading = true;
    notifyListeners();
    _currentIndex = idx;
    function(idx);
    _initPageItem();
    hideLoading();
  }

  @override
  Function function;

  @override
  void init() {
    if (currentIndex != 0) {
      _currentIndex = 0;
      onPageChange(0);
    }
    _items.clear();
    _items.addAll([
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
      ItemProduct(index: _currentIndex),
    ]);
    _isLoading = true;
    _moreLoading = false;
    _initPageItem();
  }
   
   void _initPageItem(){
    showItems.clear();
    _currentPage = 1;
    _pageNumber = (items.length / 9).ceil();
    showItems.addAll(items.getRange(0, 9));
   }

  @override
  void hideLoading() {
    Future.delayed(Duration(seconds: 1), () {
    _isLoading = false;
    notifyListeners();
    });
  }

  @override
  void onMoreItemClick() {
    _moreLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 3), () {
      _currentPage++;
      if (currentPage < pageNumber)
        showItems.addAll(
            items.getRange(9 * (currentPage - 1), 9 * (currentPage - 1) + 9));
      else if (currentPage == pageNumber)
        showItems.addAll(items.getRange(9 * (currentPage - 1), items.length));
      _moreLoading = false;
      notifyListeners();
    });
  }
}
