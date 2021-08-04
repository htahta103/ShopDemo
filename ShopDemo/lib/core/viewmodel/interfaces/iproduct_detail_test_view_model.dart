import 'package:flutter/cupertino.dart';

abstract class IProductDetailTestViewmodel extends ChangeNotifier {
  bool get isShowHeader;
  int get currentIndex;

  void setCurrentIndex(int index);
  void setShowHeader(bool isShow);
  void init();
}

class ScrollItem {
  final int index;
  final Widget item;

  ScrollItem(this.index, this.item);
}
