import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjBase.controller.dart';
import 'package:meugestorobras/base/prjMenu.view.dart';
import 'package:meugestorobras/base/prjResponsivo.view.dart';
import 'package:meugestorobras/style/prjTemaApp.view.dart';

abstract class BaseViewPage<T extends BaseControl> extends StatefulWidget {
  final T controller;
  const BaseViewPage({super.key, required this.controller});
}

abstract class BaseViewState<View extends BaseViewPage> extends State<View>
    with AutomaticKeepAliveClientMixin<View> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3))
    //     .then((value) => {FlutterNativeSplash.remove()});
    initPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: TemaCorApp.white,
      appBar: _getAppToolbar(),
      drawer: _menu(),
      body: body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget floatingActionButton() {
    return Container();
  }

  Widget? _menu() {
    return AppMenu(
      selectedIndex: -1,
    );
  }

  PreferredSize? _getAppToolbar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(Responsivo.fracaoAlturaTela(6)),
        child: AppBar(
            title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: _title(),
        )));
  }

  Widget _title() {
    return SizedBox(
      width: Responsivo.fracaoLarguraTela(70),
      child: Center(
        child: Text(
          titlePage(),
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: TemaCorApp.blue,
          ),
        ),
      ),
    );
  }

  String titlePage() {
    return "";
  }

  void initPage();

  Widget body();
}
