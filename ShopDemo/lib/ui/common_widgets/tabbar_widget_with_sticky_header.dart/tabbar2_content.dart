import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/iTabbar2_header_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tabbar2Content extends StatelessWidget {
  final PageController controller;
  final List<Widget> children;
  final ScrollPhysics physics;
  final bool isSnnaping;

  const Tabbar2Content({
    Key key,
    @required this.controller,
    @required this.children,
    this.physics,
    this.isSnnaping = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: PageView(
        onPageChanged: (int index) {
          Provider.of<ITabbar2HeaderViewmodel>(context, listen: false).onPageChange(index);
        },
        controller: controller,
        children: children,
        pageSnapping: isSnnaping,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
