import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar2_header_viewmodel.dart';
import 'package:ShopDemo/global/const.dart';
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
  return Column(
    children: [
      StickyHeader(
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
        content: MenuItemTabContent(),
      ),
      SizedBox(
        height: 50,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              "Policy",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          buildInfoBtn('Shipping information'),
          buildInfoBtn('Payment on delivery'),
          buildInfoBtn('Refund in 30 days'),
          buildInfoBtn('Payment instructions'),
          buildInfoBtn('Privacy Policy'),
          buildInfoBtn('Terms and condition'),
          SizedBox(height: 50,)
        ],
      ),
    ],
  );
}

Widget buildInfoBtn(String content) {
  return InkWell(
    onTap: () {
      //TODO
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            content,
            style: defaultStyleBold,
          ),
          Icon(
            CupertinoIcons.right_chevron,
            size: 16,
          ),
        ],
      ),
    ),
  );
}
