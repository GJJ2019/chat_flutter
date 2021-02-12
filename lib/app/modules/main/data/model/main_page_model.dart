import 'package:flutter/widgets.dart';

/// main page model for managing main page view tabs
class MainPageModel {
  ///
  MainPageModel({@required this.title, @required this.icon, @required this.activeIcon, @required this.view});

  /// label of the tab
  final String title;

  /// selected & normal icon of the tab
  final IconData icon, activeIcon;

  /// view of the tab
  final Widget view;
}
