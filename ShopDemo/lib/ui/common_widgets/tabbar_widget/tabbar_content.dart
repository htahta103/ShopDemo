import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar_header_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabbarContent extends StatelessWidget {
  final PageController controller;
  final List<Widget> children;
  final ScrollPhysics? physics;
  final bool isSnnaping;

  const TabbarContent({
    Key? key,
    required this.controller,
    required this.children,
    this.physics,
    this.isSnnaping = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (int index) {
        Provider.of<ITabbarHeaderViewmodel>(context, listen: false).onPageChange(index);
      },
      controller: controller,
      children: children,
      pageSnapping: isSnnaping,
      physics: physics,
    );
  }
}
