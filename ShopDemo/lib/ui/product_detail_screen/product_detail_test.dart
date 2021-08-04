import 'package:ShopDemo/core/viewmodel/interfaces/iproduct_detail_test_view_model.dart';
import 'package:ShopDemo/utils/loading_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:math' as math;

class ProductDetailTestScreen extends StatefulWidget {
  @override
  _ProductDetailTestScreenState createState() =>
      _ProductDetailTestScreenState();
}

class _ProductDetailTestScreenState extends State<ProductDetailTestScreen>
    with SingleTickerProviderStateMixin {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemScrollController groupScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  List<String> items = [];
  var _currentIndex;
  AutoScrollController _listviewController = AutoScrollController();
  TabController _tabController;
  Color bgColor;
  IProductDetailTestViewmodel viewmodel;
  var listItems;
  bool isTabChoosing;
  int currentScrolViewIndex;
  bool canShowProduct;
  @override
  void initState() {
    isTabChoosing = false;
    currentScrolViewIndex = 0;
    super.initState();
    items.clear();
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
    viewmodel =
        Provider.of<IProductDetailTestViewmodel>(context, listen: false);
    itemScrollController.isAttached;
    itemPositionsListener.itemPositions.addListener(() {
      if (viewmodel.isShowHeader && !isTabChoosing) {
        var index = itemPositionsListener.itemPositions.value
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .reduce((ItemPosition min, ItemPosition position) =>
                position.itemTrailingEdge < min.itemTrailingEdge
                    ? position
                    : min)
            .index;
        if (index != viewmodel.currentIndex) {
          groupScrollController.scrollTo(
              index: index == 1 ? 0 : index,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300));
          viewmodel.setCurrentIndex(index);
        }
      }
    });
  }

  Future onTabClick(int index) async {
    isTabChoosing = true;
    await groupScrollController.scrollTo(
        index: index == 1 ? 0 : index,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300));
    if (index == 0 && currentScrolViewIndex != index) {
      canShowProduct = false;
      viewmodel.setShowHeader(false);
      _currentIndex = index;
      await _listviewController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      await itemScrollController.scrollTo(
        index: 0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      currentScrolViewIndex = 0;
    } else {
      if (currentScrolViewIndex != index) {
        canShowProduct = true;
        currentScrolViewIndex = 1;
        await _listviewController.scrollToIndex(1,
            preferPosition: AutoScrollPosition.begin,
            duration: const Duration(milliseconds: 1));
      }
      await itemScrollController.scrollTo(
        index: index,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
    isTabChoosing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Selector<IProductDetailTestViewmodel, bool>(
            selector: (_, __) => viewmodel.isShowHeader,
            builder: (_, __, ___) {
              return CustomScrollView(
                physics: viewmodel.isShowHeader
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
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
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        print(constraints.constrainHeight().toString());
                        var isShowHeader = constraints.constrainHeight() < 91;

                        if (!isShowHeader) {
                          canShowProduct = false;
                          _tabController.animateTo(
                            0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        } else {
                          canShowProduct = true;
                          _tabController.animateTo(
                            1,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                          currentScrolViewIndex = 1;
                        }
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          viewmodel.setShowHeader(isShowHeader);
                        });
                        return viewmodel.isShowHeader
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Selector<IProductDetailTestViewmodel, int>(
                                      selector: (_, __) =>
                                          viewmodel.currentIndex,
                                      builder: (_, __, ___) {
                                        return Container(
                                          height: 40,
                                          child:
                                              ScrollablePositionedList.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 10,
                                            itemScrollController:
                                                groupScrollController,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () async {
                                                await onTabClick(index);
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                color: viewmodel.currentIndex ==
                                                        index
                                                    ? Colors.grey
                                                    : Colors.transparent,
                                                child: Center(
                                                  child: Text('Tab $index'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: items.map((url) {
                                          int index = items.indexOf(url);
                                          return Container(
                                            width: 4.0,
                                            height: 4.0,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  //  _current == index
                                                  //     ? Color.fromRGBO(143, 95, 67, 1)
                                                  //     :
                                                  Color.fromRGBO(
                                                      173, 173, 173, 1),
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
                  SliverToBoxAdapter(
                    child: AutoScrollTag(
                      controller: _listviewController,
                      index: 1,
                      key: ValueKey(1),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 123,
                        child: ScrollablePositionedList.builder(
                          physics: !viewmodel.isShowHeader
                              ? const NeverScrollableScrollPhysics()
                              : const AlwaysScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List<Widget>.generate(
                              index * 3,
                              (i) => Container(
                                height: 100,
                                color: Color(
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt())
                                    .withOpacity(1.0),
                                child: Text('Item $index'),
                              ),
                            ),
                          ),
                          itemScrollController: itemScrollController,
                          itemPositionsListener: itemPositionsListener,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
