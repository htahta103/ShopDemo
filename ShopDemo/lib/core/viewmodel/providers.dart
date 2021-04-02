
import 'package:ShopDemo/core/viewmodel/common_widget_viewmodel/interfaces/itabbar_header_viewmodel.dart';
import 'package:ShopDemo/core/viewmodel/implements/login_screen_viewmodel.dart';
import 'package:ShopDemo/core/viewmodel/interfaces/iproduct_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'common_widget_viewmodel/implements/tabbar2_header_viewmodel.dart';
import 'common_widget_viewmodel/implements/tabbar_header_viewmodel.dart';
import 'common_widget_viewmodel/interfaces/itabbar2_header_viewmodel.dart';
import 'implements/product_detail_viewmodel.dart';
import 'interfaces/ilogin_screen_view_model.dart';

List<SingleChildWidget> viewmodelProviders = [
  ChangeNotifierProvider<ILoginScreenViewmodel>(
    create: (_) => LoginScreenViewmodel(),
  ),

  //Common Widget Viewmodel
  ChangeNotifierProvider<ITabbarHeaderViewmodel>(
    create: (_) => TabbarHeaderViewmodel(),
  ),


  ChangeNotifierProvider<ITabbar2HeaderViewmodel>(
    create: (_) => Tabbar2HeaderViewmodel(),
  ),

  ChangeNotifierProvider<IProductDetailViewmodel>(
    create: (_) => ProductDetailViewmodel(),
  ),
];
