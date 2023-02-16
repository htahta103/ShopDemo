import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar_header_viewmodel.dart';
import 'package:ShopDemo/global/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tabbar_page_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class TabbarHeader extends StatefulWidget {
  final PageController? controller;
  final List<Tab> tabs;
  final Color? indicatorColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? onSelectedBackground;
  final Color? onSelectedTextColor;

  const TabbarHeader({
    Key? key,
    required this.controller,
    required this.tabs,
    this.backgroundColor,
    this.indicatorColor,
    this.foregroundColor,
    this.onSelectedBackground,
    this.onSelectedTextColor,
  }) : super(key: key);

  @override
  _TabbarHeaderState createState() => _TabbarHeaderState();
}

class _TabbarHeaderState extends State<TabbarHeader> {
  late ITabbarHeaderViewmodel _viewmodel;
  AutoScrollController? _listviewController;
  @override
  void initState() {
    _viewmodel = Provider.of<ITabbarHeaderViewmodel>(context, listen: false);
    _listviewController = AutoScrollController();
    _viewmodel.function = _scrollToIndex;
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _listviewController!.scrollToIndex(index,
        preferPosition: AutoScrollPosition.middle);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: widget.foregroundColor ??
              Theme.of(context).primaryIconTheme.color),
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Consumer<ITabbarHeaderViewmodel>(builder: (_, __, ___) {
                return ListView(
                  controller: _listviewController,
                  scrollDirection: Axis.horizontal,
                  children: widget.tabs.map((item) {
                    var index = widget.tabs.indexOf(item);
                    return AutoScrollTag(
                      index: index,
                      controller: _listviewController!,
                      key: ValueKey(index),
                      child: InkWell(
                        child: Container(
                          color: _viewmodel.currentIndex == index
                              ? Colors.black
                              : Colors.white,
                          constraints: BoxConstraints(
                            minWidth: 90,
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Center(
                            child: Text(
                              item.text!,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: defaultFont,
                                  color: _viewmodel.currentIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        onTap: () {
                          _viewmodel.onPageChange(index);
                          if (widget.controller!.isInitialized)
                            widget.controller!.animateToPage(
                              widget.tabs.indexOf(item),
                              // tabs.indexWhere((tab) => tab.text == item.text),
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 200),
                            );
                        },
                      ),
                    );
                  }).toList(),
                );
              }),
            ),
            // TabbarIndicator(
            //   controller: controller,
            //   color: indicatorColor,
            //   tabs: tabs,
            // ),
          ],
        ),
      ),
    );
  }
}
