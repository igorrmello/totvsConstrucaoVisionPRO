import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjRouter.view.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final NavigationService _instancia = NavigationService._();

  static NavigationService get instancia => _instancia;

  NavigationService._();

  Future<dynamic> navigateTo(String? routeName,
      {bool popCurrent = false, Map<String, dynamic>? args}) async {
    if (routeName == null || routeName.isEmpty) {
      return null;
    }

    if (popCurrent) {
      return navigatorKey.currentState
          ?.pushReplacementNamed(routeName, arguments: args);
    } else {
      return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
    }
  }

  Future<dynamic>? navigateAsRootTo(String routeName) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(routeName),
    );
  }

  Future<dynamic>? navigateAsRootToCaracteristicaPrd(String routeName) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(routeName),
    );
  }

  Future<dynamic>? navigateAsRootToLogin() {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      AppRouter.mainMasterPage,
      ModalRoute.withName(AppRouter.mainMasterPage),
    );
  }
}
