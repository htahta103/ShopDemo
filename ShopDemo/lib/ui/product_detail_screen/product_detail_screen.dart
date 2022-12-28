import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  List<String> items = [];
  var _currentIndex;
  AutoScrollController _listviewController = AutoScrollController();
  TabController _tabController;
  Color bgColor;
  GlobalKey<RectGetterState> globalKey;
  List<GlobalKey<RectGetterState>> tabKeys = [];
  bool onTapClick = false;
  @override
  void initState() {
    super.initState();
    items.clear();
    globalKey = RectGetter.createGlobalKey();
    tabKeys
        .addAll([RectGetter.createGlobalKey(), RectGetter.createGlobalKey()]);
    items.addAll([
      'product_img1.png',
      'product_img2.png',
      'product_img3.png',
      'product_img4.png'
    ]);
    _currentIndex = 0;
    _tabController =
        TabController(vsync: this, initialIndex: _currentIndex, length: 3);
    bgColor = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            if (onTapClick) return false;
            var rect = RectGetter.getRectFromKey(globalKey);
            var keys = tabKeys.reversed.toList();
            var index = keys.length - 1;

            for (final key in keys) {
              var itemRect = RectGetter.getRectFromKey(key);
              if (itemRect != null &&
                  rect != null &&
                  (itemRect.top < rect.bottom - 100)) {
                _currentIndex = index;
                _tabController
                  ..animateTo(
                    index + 1,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                break;
              }
              index--;
            }
            return true;
          },
          child: CustomScrollView(
            controller: _listviewController,
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Color.fromRGBO(157, 158, 163, 1),
                  ),
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.cart,
                        color: Color.fromRGBO(157, 158, 163, 1),
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.ellipsis,
                        color: Color.fromRGBO(157, 158, 163, 1),
                      ),
                      onPressed: () {}),
                ],
                backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                expandedHeight: 400.0,
                collapsedHeight: 90,
                // floating: true,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    bool isHeaderShow = constraints.constrainHeight() < 91;
                    if (!isHeaderShow)
                      _tabController.animateTo(
                        0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    return isHeaderShow
                        ? Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 40,
                                child: TabBar(
                                  controller: _tabController,
                                  onTap: (index) async {
                                    onTapClick = true;
                                    if (index == 0) {
                                      _currentIndex = index;
                                      await _listviewController.animateTo(
                                        0.0,
                                        curve: Curves.easeOut,
                                        duration:
                                            const Duration(milliseconds: 300),
                                      );
                                    } else if (index == 1) {
                                      await _listviewController.scrollToIndex(1,
                                          preferPosition:
                                              AutoScrollPosition.begin,
                                          duration:
                                              const Duration(milliseconds: 1));
                                    } else if (index == 2) {
                                      await _listviewController.scrollToIndex(2,
                                          preferPosition:
                                              AutoScrollPosition.begin,
                                          duration:
                                              const Duration(milliseconds: 2));
                                    }
                                    onTapClick = false;
                                  },
                                  labelColor: Colors.black87,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: [
                                    new Tab(
                                      text: "Product",
                                    ),
                                    new Tab(text: "Product Info"),
                                    new Tab(text: "Relative Product"),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : FlexibleSpaceBar(
                            centerTitle: true,
                            background: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    color: Colors.black,
                                    child: CarouselSlider(
                                      items: items.map((item) {
                                        return Image.asset(
                                          'assets/images/$item',
                                          fit: BoxFit.cover,
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                          viewportFraction: 1,
                                          aspectRatio: 1,
                                          autoPlay: false,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              // _current = index;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: items.map((url) {
                                      int index = items.indexOf(url);
                                      return Container(
                                        width: 4.0,
                                        height: 4.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              //  _current == index
                                              //     ? Color.fromRGBO(143, 95, 67, 1)
                                              //     :
                                              Color.fromRGBO(173, 173, 173, 1),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
              RectGetter(
                key: globalKey,
                child: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 500,
                        color: Colors.black,
                      ),
                      AutoScrollTag(
                        controller: _listviewController,
                        index: 1,
                        key: ValueKey(1),
                        child: RectGetter(
                          key: tabKeys[0],
                          child: Container(
                            height: 500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      AutoScrollTag(
                        controller: _listviewController,
                        index: 2,
                        key: ValueKey(2),
                        child: RectGetter(
                          key: tabKeys[1],
                          child: Container(
                            height: 300,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
