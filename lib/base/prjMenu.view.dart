// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:meugestorobras/base/prjNavigation.service.dart';
import 'package:meugestorobras/base/prjResponsivo.view.dart';
import 'package:meugestorobras/base/prjRouter.view.dart';
import 'package:meugestorobras/style/prjTemaApp.view.dart';
import 'package:intl/intl.dart';

class AppMenu extends StatefulWidget {
  AppMenu({super.key, required int selectedIndex});
  late int _selectedIndex = -1;
  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  final DateFormat formatterDate = DateFormat('dd/MM/yyyy');
  final formatterCurrencyPermutas =
      NumberFormat.currency(locale: "pt_Br", symbol: "N\$");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      backgroundColor: TemaCorApp.black,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: Responsivo.fracaoAlturaTela(35),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: TemaCorApp.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Perfil',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: TemaCorApp.white)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: TemaCorApp.blue,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Cliente Logado',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: TemaCorApp.white)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Totvs',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: TemaCorApp.orange)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                        'Ultimo acesso em ${formatterDate.format(DateFormat('yyyy-M-d').parse(DateTime.now().toString()))}',
                        style: const TextStyle(
                            fontSize: 10, color: TemaCorApp.textField)),
                  ),
                ],
              ),
            ),
          ),
          getListTile(
              0, ' Fornecedor', Icons.person, navigationtoAssociadoView),
          getListTile(
              1, ' Minha Obra', Icons.password, navigationtoAlterarSenhaView),
          getListTile(2, 'Portal do Cliente', Icons.person_off,
              navigationtoExclusaoConta),
          getListTile(3, 'Sair', Icons.logout, logoutMsg),
        ],
      ),
    );
  }

  Widget getListTile(index, String menuTex, IconData? icon, Function action) {
    return ListTile(
        title: Row(
          children: [
            Icon(icon,
                color: widget._selectedIndex == index
                    ? TemaCorApp.orange
                    : TemaCorApp.white),
            Text(menuTex,
                style: TextStyle(
                    fontSize: 14,
                    color: widget._selectedIndex == index
                        ? TemaCorApp.orange
                        : Colors.white)),
          ],
        ),
        onTap: () {
          _onItemTapped(index);
          Navigator.pop(context);
          action();
        });
  }

  void _onItemTapped(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  void logoutMsg() {
    NavigationService.instancia.navigateAsRootTo(AppRouter.login);
  }

  void navigationtoAlterarSenhaView() {
    NavigationService.instancia.navigateAsRootTo(AppRouter.webViewMinhaObra);
  }

  void navigationtoExclusaoConta() {
    NavigationService.instancia.navigateTo(AppRouter.webViewPortalCliente);
  }

  void navigationtoAssociadoView() {
    NavigationService.instancia.navigateAsRootTo(AppRouter.webviewFornecedor);
  }

  void logout() {
    // final dbHelper = DataBasePermutas.instance;
    // dbHelper.delete(1).then((value) {
    //   NavigationService.instancia.navigateAsRootTo(AppRouter.loginAcesso);
    // });
  }
}
