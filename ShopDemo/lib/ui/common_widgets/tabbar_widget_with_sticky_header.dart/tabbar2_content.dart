import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar2_header_viewmodel.dart';
import 'package:ShopDemo/global/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';

import '../custom_price_textfield.dart';

class ItemProduct extends StatelessWidget {
  final int? index;

  const ItemProduct({Key? key, this.index}) : super(key: key);
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
              price: 100000 + index!.toDouble(),
              isSale: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemTabContent extends StatefulWidget {
  const MenuItemTabContent({Key? key}) : super(key: key);
  @override
  _MenuItemTabContentState createState() => _MenuItemTabContentState();
}

class _MenuItemTabContentState extends State<MenuItemTabContent> {
  late ITabbar2HeaderViewmodel _viewmodel;
  @override
  void initState() {
    super.initState();
    _viewmodel = Provider.of<ITabbar2HeaderViewmodel>(context, listen: false);
    _viewmodel.hideLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ITabbar2HeaderViewmodel>(builder: (_, __, ___) {
      return _viewmodel.isLoading!
          ? ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height - 270),
              ),
              child: Container(
                alignment: Alignment.topCenter,
                child: LoadingFadingLine.square(
                  size: 30,
                  backgroundColor: Colors.black,
                ),
              ),
            )
          : Stack(children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _viewmodel.showItems,
                ),
              ),
              _viewmodel.currentPage == _viewmodel.pageNumber &&
                      !_viewmodel.moreLoading!
                  ? SizedBox()
                  : Positioned(
                      bottom: 0.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromRGBO(240, 240, 240, 1),
                              Color.fromRGBO(255, 255, 255, 0.5),
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            _viewmodel.onMoreItemClick();
                          },
                          child: _viewmodel.moreLoading!
                              ? Container(
                                  alignment: Alignment.topCenter,
                                  child: LoadingFadingLine.square(
                                    size: 30,
                                    backgroundColor: Colors.black,
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 240, 240, 1),
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(34, 34, 34, 1))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'View more',
                                        style: defaultStyleBold,
                                      ),
                                      Icon(
                                        CupertinoIcons.chevron_down,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
            ]);
    });
  }
}
