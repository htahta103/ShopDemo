import 'package:flutter/widgets.dart';

extension Tabbar2PageControllerExtension on PageController {
  double get page => positions.isEmpty ? 0 : page;

  bool get isInitialized => positions.isNotEmpty;
  bool get isNotInitialized => positions.isEmpty;
}
