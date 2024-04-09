// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjBase.view.dart';
import 'package:meugestorobras/masterpage/prjMasterPage.Controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MasterPageView extends BaseViewPage<MasterPageController> {
  MasterPageView({super.key}) : super(controller: MasterPageController());

  @override
  _MasterPageView createState() => _MasterPageView();
}

class _MasterPageView extends BaseViewState<MasterPageView> {
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
      ..loadRequest(Uri.parse('https://www.totvs.com/construcao/'));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
