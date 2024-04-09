import 'package:flutter/material.dart';
import 'package:meugestorobras/main.dart';
import 'package:meugestorobras/masterpage/prjMasterPage.view.dart';
import 'package:meugestorobras/webviewFornecedor/prjwebviewFornecedor.view.dart';
import 'package:meugestorobras/webviewMinhaObra/prjwebviewMinhaObra.view.dart';
import 'package:meugestorobras/webviewPortalCliente/prjwebviewPortalCliente.view.dart';

class AppRouter {
  static const String mainMasterPage = '/home';
  static const String webviewFornecedor = '/webviewFornecedor';
  static const String webViewMinhaObra = '/webViewMinhaObra';
  static const String webViewPortalCliente = '/webViewPortalCliente';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.mainMasterPage:
        return MaterialPageRoute(
          builder: (_) => MasterPageView(),
          fullscreenDialog: false,
        );

      case AppRouter.webviewFornecedor:
        return MaterialPageRoute(
          builder: (_) => WebViewFornecedor(),
          fullscreenDialog: false,
        );

      case AppRouter.webViewMinhaObra:
        return MaterialPageRoute(
          builder: (_) => WebViewMinhaObra(),
          fullscreenDialog: false,
        );

      case AppRouter.webViewPortalCliente:
        return MaterialPageRoute(
          builder: (_) => WebViewPortalCliente(),
          fullscreenDialog: false,
        );

      case AppRouter.login:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'Entrar novamente'),
          fullscreenDialog: false,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'sair'),
          fullscreenDialog: true,
        );
    }
  }

  static dynamic _extractArgument(RouteSettings settings, String name) {
    try {
      if (settings.arguments == null) {
        return null;
      }

      return (settings.arguments as Map)[name];
    } catch (e) {
      return null;
    }
  }
}
