import 'package:FoodFood/core/viewmodel/implements/login_screen_viewmodel.dart';
import 'package:FoodFood/core/viewmodel/interfaces/ilogin_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewmodelProviders = [
  ChangeNotifierProvider<ILoginScreenViewmodel>(
    create: (_) => LoginScreenViewmodel(),),
];