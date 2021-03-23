import 'package:ShopDemo/ui/common_widgets/custom_price_textfield.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget_with_sticky_header.dart/custom_tabbar2.dart';
import 'package:ShopDemo/ui/common_widgets/tabbar_widget_with_sticky_header.dart/tabbar2_content.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:loading_animations/loading_animations.dart';

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
      child: stickyHeader(controller, context, loadingAndScroll),
    );
  }
}

Widget stickyHeader(PageController controller, BuildContext context,
    Function loadingAndScroll) {
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
        tabs: [
          Tab(
            text: 'Top',
          ),
          Tab(text: "Hot"),
          Tab(text: 'Skirt'),
          Tab(text: 'Accessories'),
          Tab(text: 'Shirt'),
          Tab(text: 'Croptop'),
          Tab(text: 'Bikini'),
        ],
      ),
    ),
    content: Tabbar2Content(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: <Widget>[
        // ShopHomeScreen(),
       MenuItemTabContent(),
       MenuItemTabContent(),
       MenuItemTabContent(),
       MenuItemTabContent(),
       MenuItemTabContent(),
      ],
    ),
  );
}

class ItemProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 40) / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/default_product.jpg',
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 5,
            ),
            CustomPriceTextField(
              price: 100000,
              isSale: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemTabContent extends StatefulWidget {
  @override
  _MenuItemTabContentState createState() => _MenuItemTabContentState();
}

class _MenuItemTabContentState extends State<MenuItemTabContent> {
  bool isLoading;
  List<Widget> items =  [
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
              ];
    List<Widget> showItems = [];
    

  @override
  void initState() {
    isLoading = true;
    showItems.clear();
    showItems.addAll(items.getRange(0,12));
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
          alignment: Alignment.topCenter,
          child: LoadingFadingLine.square(
              size: 30,
              backgroundColor: Colors.black,
            ),
        )
        : Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: showItems,
            ),
          );
  }
}
