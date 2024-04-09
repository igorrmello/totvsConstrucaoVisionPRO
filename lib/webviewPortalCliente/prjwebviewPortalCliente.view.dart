import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjBase.view.dart';
import 'package:meugestorobras/webviewPortalCliente/prjwebviewPortalCliente.controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPortalCliente
    extends BaseViewPage<WebViewPortalClienteController> {
  WebViewPortalCliente({super.key})
      : super(controller: WebViewPortalClienteController());

  @override
  _WebViewPortalCliente createState() => _WebViewPortalCliente();
}

class _WebViewPortalCliente extends BaseViewState<WebViewPortalCliente> {
  late final WebViewController _controller;

  @override
  Widget body() {
    return WebViewWidget(controller: _controller);
  }

  @override
  void initPage() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.globo.com/'));
  }

  @override
  bool get wantKeepAlive => false;
}
