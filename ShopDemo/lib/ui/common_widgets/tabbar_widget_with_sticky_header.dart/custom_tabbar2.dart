import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/iTabbar2_header_viewmodel.dart';
import 'package:ShopDemo/global/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'tabbar2_page_controller.dart';

class Tabbar2Header extends StatefulWidget {
  final PageController controller;
  final List<Tab> tabs;
  final Color indicatorColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color onSelectedBackground;
  final Color onSelectedTextColor;
  final Function loadingAndScroll;

  const Tabbar2Header({
    Key key,
    @required this.controller,
    @required this.tabs,
    this.backgroundColor,
    this.indicatorColor,
    this.foregroundColor,
    this.onSelectedTextColor,
    this.onSelectedBackground,
    this.loadingAndScroll,
  }) : super(key: key);

  @override
  _Tabbar2HeaderState createState() => _Tabbar2HeaderState();
}

class _Tabbar2HeaderState extends State<Tabbar2Header> {
  ITabbar2HeaderViewmodel _viewmodel;
  AutoScrollController _listviewController;
  @override
  void initState() {
    _viewmodel = Provider.of<ITabbar2HeaderViewmodel>(context, listen: false);
    _listviewController = AutoScrollController();
    _viewmodel.function = _scrollToIndex;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _viewmodel.init());
  }

  Future _scrollToIndex(int index) async {
    await _listviewController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.middle);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2.copyWith(
          color: widget.foregroundColor ??
              Theme.of(context).primaryIconTheme.color),
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Consumer<ITabbar2HeaderViewmodel>(builder: (_, __, ___) {
                return ListView(
                  controller: _listviewController,
                  scrollDirection: Axis.horizontal,
                  children: widget.tabs.map((item) {
                    var index = widget.tabs.indexOf(item);
                    return AutoScrollTag(
                      index: index,
                      controller: _listviewController,
                      key: ValueKey(index),
                      child: InkWell(
                        child: Container(
                          color: Colors.white,
                          constraints: BoxConstraints(
                            minWidth: 90,
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Center(
                            child: Text(
                              item.text,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: _viewmodel.currentIndex == index
                                      ? Colors.black
                                      : Color.fromRGBO(122, 122, 122, 1),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        onTap: () {
                          _viewmodel.onPageChange(index);
                          if (widget.controller.isInitialized)
                            widget.controller.animateToPage(
                              widget.tabs.indexOf(item),
                              // tabs.indexWhere((tab) => tab.text == item.text),
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 200),
                            );
                            widget.loadingAndScroll();
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
