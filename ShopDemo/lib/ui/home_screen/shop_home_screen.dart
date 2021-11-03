import 'package:ShopDemo/ui/buy_by_type_screen/buy_by_type.dart';
import 'package:ShopDemo/ui/home_screen/common_widgets/flash_sale_widget.dart';
import 'package:ShopDemo/ui/home_screen/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'common_widgets/freeship_widget.dart';

class ShopHomeScreen extends StatelessWidget {
  final AutoScrollController _listviewController = AutoScrollController();

  Future<void> scrollToIndex() async {
    await _listviewController.scrollToIndex(0,
        preferPosition: AutoScrollPosition.begin, duration: const Duration(milliseconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: _listviewController,
        children: [
          Freeship(),
          Container(
            height: 200,
          ),
          FlashSaleWidget(),
          BuyByType(),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          AutoScrollTag(
            controller: _listviewController,
            child:  MenuItem(autoScroll: scrollToIndex,),
            index: 0,
            key: ValueKey(0),
          ),
        ],
      ),
    );
  }
}
