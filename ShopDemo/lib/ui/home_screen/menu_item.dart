import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar2_header_viewmodel.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget_with_sticky_header.dart/custom_tabbar2.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget_with_sticky_header.dart/tabbar2_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class MenuItem extends StatelessWidget {
  final Function autoScroll;
  const MenuItem({Key key, this.autoScroll}) : super(key: key);

  Future<void> loadingAndScroll() async {
    //TODO loading
    await autoScroll();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Container(
      child: stickyHeader(controller, loadingAndScroll),
    );
  }
}

Widget stickyHeader(PageController controller, Function loadingAndScroll) {
  return StickyHeader(
    header: Container(
      height: 40.0,
      color: Colors.blueGrey[700],
      alignment: Alignment.centerLeft,
      child: Tabbar2Header(
        loadingAndScroll: loadingAndScroll,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        controller: controller,
      ),
    ),
    content: MenuItemTabContent()
    );
}
