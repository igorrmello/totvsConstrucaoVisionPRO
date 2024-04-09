import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjBase.view.dart';
import 'package:meugestorobras/webviewFornecedor/prjwebViewFornecedor.controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFornecedor extends BaseViewPage<WebViewFornecedorController> {
  WebViewFornecedor({super.key})
      : super(controller: WebViewFornecedorController());

  @override
  _WebViewFornecedor createState() => _WebViewFornecedor();
}

class _WebViewFornecedor extends BaseViewState<WebViewFornecedor> {
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
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  bool get wantKeepAlive => false;
}
